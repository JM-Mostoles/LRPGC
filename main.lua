local world
local FacilPlayer = require("libraries.FacilPlayer")
local FacilObject = require("libraries.FacilObject")
function love.load()
  world = love.physics.newWorld(0, 0, true)
  facildidy = FacilPlayer.new(world, 90, 90, 20, 20, 100)
  obj1 = FacilObject.new(world, 20, 40, 10, 30)
  obj2 = FacilObject.new(world, 40, 140, 50, 40)
end

function love.update(dt)
  facildidy:update(dt)
  world:update(dt)
end

function love.keypressed(key)
end

function love.draw()
  facildidy:draw()
  obj1:draw()
  obj2:draw()
end
