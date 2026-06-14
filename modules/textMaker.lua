require("modules.easyTimer")

textbox_class = {
	image = love.graphics.newImage("rs/textMaker/tM_textbox.png"),
	X = (256 / 2),
	Y = (224 / 2),
	placementOfY = { bottom = 176, top = 48 },
	isAtBottom = true,
}

textbox_class.oX = math.floor(textbox_class.image:getWidth() / 2)
textbox_class.oY = math.floor(textbox_class.image:getHeight() / 2)

function textbox_class:update(dt)
	if self.isAtBottom then
		self.Y = self.placementOfY.bottom
	else
		self.Y = self.placementOfY.top
	end
end

function textbox_class:draw()
	love.graphics.draw(self.image, self.X, self.Y, 0, 1, 1, self.oX, self.oY)
end

--[[
local metaBox = {}
metaBox.__index = textbox_class

function textbox_class.new(X, Y)
	local textInstance = setmetatable({}, metaBox)

	textInstance.X = X 
	textInstance.Y = Y

	return textInstance
end
]]