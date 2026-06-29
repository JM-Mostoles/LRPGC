local FacilTimer_class = {
	startAt = 0,
	finishAt = 0,
	currentTime = 0,
	speed = 1,
	loops = true,
	isPaused = false,
}

function FacilTimer_class:paused(bool)
	self.isPaused = bool
end

function FacilTimer_class:alternatePause()
	self.isPaused = not self.isPaused
end

function FacilTimer_class:willLoop(bool)
	self.loops = bool
end

function FacilTimer_class:toggleLoop()
	self.loops = not self.loops
end

function FacilTimer_class:update(dt)
	if self.isPaused == false then
		self.currentTime = self.currentTime - (self.speed * dt)

		if self.currentTime <= self.finishAt then
			if self.loops then
				self.currentTime = self.startAt
			else
				self:paused(true)
				self.currentTime = self.finishAt
			end
		end
	end

	if self.loops == true and self.currentTime == self.finishAt then
		self:paused(false)
	end
end

local metaTimer = {}
metaTimer.__index = FacilTimer_class

function FacilTimer_class.newTimerObject(startAt, finishAt, speed, loops, startPaused)
	local instance = setmetatable({}, metaTimer)

	instance.startAt = startAt or 10
	instance.finishAt = finishAt or 0
	instance.currentTime = instance.startAt
	instance.speed = speed or 1
	instance.loops = loops ~= false
	instance.isPaused = startPaused == true

	return instance
end

return FacilTimer_class