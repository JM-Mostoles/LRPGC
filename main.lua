function love.load()
	Didy = require("facilPlayer")
    Blud = require("FacilObstacle")
    Blud.myPlayer = Didy

end

function love.update(dt)
	Didy:update(dt)
    Blud:update(dt)

end

function love.keyreleased(key)
	Didy:keyreleased(key)

end

function love.draw()
	Didy:draw()
    Blud:draw()
end
