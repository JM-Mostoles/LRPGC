# FacilFade

## Usage

FacilFade is a very simple way to make fading objects of different colors and speeds.
You may create one with the subsequent parameters in your block of code:

```lua
local newFade

function love.load()
	local FacilFade = require("modules.FacilFade")

	newFade = FacilFade.new(
		(Start fully faded in?, a boolean), 
		(Speed, int recommended), 
		(red value, int recommended), 
		(green value, int recommended), 
		(blue value, int recommended), 
	)
end
```
By default, the .new() arguments are the following:
```lua
true, 1, 1, 1, 1
```

## Methods

- :setIn(boolean)  
[Changes if the object fades in or out]
- :setColor(r, g, b)

## Example of usage

```lua

--Main.lua

local FacilFade = require("libraries.FacilFade")

local newFade
function love.load()
    newFade = FacilFade.new(false, 1, 1, 1, 1)
end

function love.update(dt)
    newFade:update(dt)
end

function love.draw()
    newFade:draw()
end
