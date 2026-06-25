local FacilPlayer = {}

function FacilPlayer.new(playerWorld, pX, pY, pW, pH, pSpeed)
    local newPlayer = {
        body = love.physics.newBody(playerWorld, pX, pY, "dynamic"),
        shape = love.physics.newRectangleShape(pW, pH),
        currentSpeed = pSpeed,
        speedReal = pSpeed,
        speedNorm = pSpeed - (pSpeed * 0.4),
        xDir = 0,
        yDir = 0,
        dx = 0,
        dy = 0
    }
    newPlayer.fixture = love.physics.newFixture(newPlayer.body, newPlayer.shape)

    function newPlayer:update(dt)
        self.dx, self.dy = 0, 0
        self.xDir, self.yDir = 0, 0
        self.rightKey = love.keyboard.isDown("right")
        self.leftKey = love.keyboard.isDown("left")
        self.upKey = love.keyboard.isDown("up")
        self.downKey = love.keyboard.isDown("down")

        if self.leftKey and self.xDir == 0 then self.xDir = -1 end
        if self.rightKey and self.xDir == 0 then self.xDir = 1 end
        if self.upKey and self.yDir == 0 then self.yDir = -1 end
        if self.downKey and self.yDir == 0 then self.yDir = 1 end

        if (self.xDir == 1) then
            self.dx = self.currentSpeed
        end

        if (self.xDir == -1) then
            self.dx = -self.currentSpeed
        end

        if (self.yDir == 1) then
            self.dy = self.currentSpeed
        end

        if (self.yDir == -1) then
            self.dy = -self.currentSpeed
        end

        if (self.leftKey or self.rightKey) and (self.upKey and self.downKey) then
            self.currentSpeed = self.speedNorm
        else
            self.currentSpeed = self.speedReal
        end

        self.body:setLinearVelocity(self.dx, self.dy)
    end

    function newPlayer:draw(dt)
        local x, y = self.body:getPosition()
        local x2, y2 = pW / 2, pH / 2
        love.graphics.rectangle(
            "line",
            x - x2,
            y - y2,
            pW,
            pH
        )
    end

    return newPlayer
end

return FacilPlayer
