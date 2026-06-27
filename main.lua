local facilanims = require("libraries.FacilAnims")
function love.load()
  image = love.graphics.newImage("rs/gub.png")
  cof = facilanims.new(image, 2, 2, 10, 20, 20, 10, 10)
end

function love.update(dt)
  cof:update(dt)
end

function love.keypressed(key)
end

function love.draw()
  cof:play()
end
