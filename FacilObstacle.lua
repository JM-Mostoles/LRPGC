local FacilObstacle = {
    X = 105,
    Y = 105,
    oX = 15,
    oY = 15,
    cW = 40,
    cH = 40,
    myPlayer = {}
}

function FacilObstacle:detectPlayer(player)
    player = self.myPlayer

    return player.X < self.X + self.cW and
        player.X + player.cW > self.X and
        player.Y < self.Y + self.cH and
        player.Y + player.cH > self.Y
end

function FacilObstacle:update(player)
    player = self.myPlayer

    if self:detectPlayer() then
        player.X, player.Y = player.oldX, player.oldY
    end
end

function FacilObstacle:draw()
    love.graphics.setColor(1, 0, 1)
    love.graphics.rectangle("fill", self.X - self.oX, self.Y - self.oY,
        self.cW,
        self.cH)
    love.graphics.setColor(1, 1, 1)
end

return FacilObstacle
