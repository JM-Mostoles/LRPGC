Timer_class = {
	startAt = 0,
	finishAt = 0,
	currentTime = 0,
	speed = 1,
	loops = true,
	isPaused = false,
}

function Timer_class:paused(bool)
	self.isPaused = bool
end

function Timer_class:alternatePause()
	self.isPaused = not self.isPaused
end

function Timer_class:willLoop(bool)
	self.loops = bool
end

function Timer_class:toggleLoop()
	self.loops = not self.loops
end

function Timer_class:update(dt)
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
end

local metaTimer = {}
metaTimer.__index = Timer_class

function Timer_class.new(startAt, finishAt, speed, loops, startPaused)
	local instance = setmetatable({}, metaTimer)

	instance.startAt = startAt or 10
	instance.finishAt = finishAt or 0
	instance.currentTime = instance.startAt
	instance.speed = speed or 1
	instance.loops = loops ~= false
	instance.isPaused = startPaused == true

	return instance
end
