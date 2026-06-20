local FacilPlayer = {
    X = 15,
    Y = 15,
    oX = 15,
    oY = 15,
    cW = 30,
    cH = 30,
    speed = 100,
    xDir = 0,
    yDir = 0,
    rightKey = love.keyboard.isDown("right"),
    leftKey = love.keyboard.isDown("left"),
    upKey = love.keyboard.isDown("up"),
    downKey = love.keyboard.isDown("down"),
    oldX = 0,
    oldY = 0

}

function FacilPlayer:update(dt)
    self.oldX, self.oldY = self.X, self.Y

    self.rightKey = love.keyboard.isDown("right")
    self.leftKey = love.keyboard.isDown("left")
    self.upKey = love.keyboard.isDown("up")
    self.downKey = love.keyboard.isDown("down")

    if self.leftKey and self.xDir == 0 then self.xDir = -1 end
    if self.rightKey and self.xDir == 0 then self.xDir = 1 end
    if self.upKey and self.yDir == 0 then self.yDir = -1 end
    if self.downKey and self.yDir == 0 then self.yDir = 1 end

    if (self.xDir == 1) then
        self.X = self.X + (self.speed * dt)
    end
    if (self.xDir == -1) then
        self.X = self.X - (self.speed * dt)
    end
    if (self.yDir == 1) then
        self.Y = self.Y + (self.speed * dt)
    end
    if (self.yDir == -1) then
        self.Y = self.Y - (self.speed * dt)
    end
end

function FacilPlayer:keyreleased(key)
    if key == "right" or key == "left" then
        FacilPlayer.xDir = 0
    end
    if key == "up" or key == "down" then
        FacilPlayer.yDir = 0
    end
end

function FacilPlayer:draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", FacilPlayer.X - FacilPlayer.oX, FacilPlayer.Y - FacilPlayer.oY, FacilPlayer.cW,
        FacilPlayer.cH)
    love.graphics.setColor(1, 1, 1)
end

return FacilPlayer