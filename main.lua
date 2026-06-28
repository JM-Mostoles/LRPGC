local playerLib = require("libraries.FacilPlayer")
local objectLib = require("libraries.FacilObject")

local world
local newPlayer
local newObject

function love.load()
    world = love.physics.newWorld(0, 0, true)
    newPlayer = playerLib.new(world, 20, 20, 10, 4, 100)
    newObject = objectLib.new(world, 90, 80, 30, 30)
end

function love.update(dt)
    newPlayer:update(dt)
    world:update(dt)
end

function love.keypressed(key)

end

function love.draw()
    newPlayer:draw()
    newObject:draw()

end
