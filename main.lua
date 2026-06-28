function love.load()
    hi = require("libraries.FacilAnimPlayer")
    yo = hi.newAnimation(love.graphics.newImage("rs/boyagobb.png"), 4, 2, 2, 10)
end

function love.update(dt)
    yo:update(dt)
end

function love.keypressed(key)
    if key == "q" then
        yo:togglePause()
    end
end

function love.draw()
    yo:play()
end
