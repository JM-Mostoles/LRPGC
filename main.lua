local myTextbox

function love.load()
	local FacilTextbox = require("libraries.FacilTextbox")
	myTextbox = FacilTextbox.newTextboxObject(true, 20, { "Like the wind", "you came running", "Waoawoaw" }, 1, 1, 1, 1)
end

function love.update(dt)
	myTextbox:update(dt)
        if myTextbox.typewriter_linesIndex == 2 then
            myTextbox:modifyName(1, 0, 1, 1, "FEX")
            myTextbox:changeColor(1, 1, 0, 1)
        end
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
