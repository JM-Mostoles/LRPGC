local FacilFade = {
    alpha = 1,
    speed = 1,
    r = 1,
    g = 1,
    b = 1,
    isIn = true
}

function FacilFade:setIn(boolean)
    self.isIn = boolean
end

function FacilFade:setColor(r, g, b)
    self.r = r
    self.g = g
    self.b = b
end

function FacilFade:update(dt)
    if self.isIn == true then
        self.alpha = math.max(self.alpha - (self.speed * dt), 0)
    else
        self.alpha = math.min(self.alpha + (self.speed * dt), 1)
    end
end

function FacilFade:draw()
    love.graphics.setColor(self.r, self.g, self.b, self.alpha)
    love.graphics.rectangle("fill", 0, 0, 256, 224)
    love.graphics.setColor(1, 1, 1, 1)
end

local metaFade = {}
metaFade.__index = FacilFade

function FacilFade.newFadeObject(startIn, speed, r, g, b)
    local FadeInstance = setmetatable({}, metaFade)

    FadeInstance.isIn = startIn
    if startIn == false then
        FadeInstance.alpha = 0
    end
    FadeInstance.speed = speed or 1
    FadeInstance.r = r or 1
    FadeInstance.g = g or 1
    FadeInstance.b = b or 1

    return FadeInstance
end

return FacilFade
