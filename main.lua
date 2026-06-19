local myTextbox

function love.load()
	require("modules.textMaker")
	myTextbox = Textbox_class.new(true, 20, {"Hola que tal", "Como estas", "Yo bien y tu"})
	myTextbox:setIn(true)
end

function love.update(dt)
	myTextbox:update(dt)
end

function love.keypressed(key)
	myTextbox:keypressed(key)
end

function love.draw()
	myTextbox:draw()
end