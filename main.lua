function love.load()
    require("modules.textMaker")
end

function love.update(dt)
    textbox_class:update(dt)
end

function love.keypressed(key)

end

function love.draw()
    love.graphics.draw(love.graphics.newImage("rs/general/bg.png"))
    textbox_class:draw(dt)
end