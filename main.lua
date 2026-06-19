local myTextbox

function love.load()
	require("modules.FacilTextbox")
	myTextbox = FacilTextbox_class.new(true, 20, { "Like the wind", "you came running" }, 1, 1, 1, 1)
end

function love.update(dt)
	myTextbox:update(dt)
end

function love.keypressed(key)
	myTextbox:keypressed(key)
	if myTextbox.general_isIn == false then
		if key == "a" then
			myTextbox:setIn(true)
		end
	end
end

function love.draw()
	myTextbox:draw()
end