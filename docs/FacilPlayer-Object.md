# FacilPlayer and FacilObject

## Preamble
FacilPlayer and FacilObject are simple wrap ups of love.physics, made easier to instanciate and with prebuilt features, such as a movement for the player. Notice these 2 should be used as templates for your own objects since they lack texture/ image. Of course, feel free to modify these libraries as you desire.

## Usage
### Creating a new world with love.physics
These 2 libraries recieve a world as an argument. To create one, we do the following:
```lua
local world = love.physics.newWorld(0, 0, true)
```
---
Please do notice, world needs the update methods :update(dt) in our update function.
```lua
function love.update(dt)
    world:update(dt)
end
```

### Creating a new player with FacilPlayer
We must pass the following arguments to the .new function:
```lua
newPlayer = playerLib.new(
    (World, our world), 
    (Position in X, the stating position in X. Int recommended), 
    (Position in Y, the stating position in Y. Int recommended), 
    (Width, int recommended), 
    (Height, int recommended), 
    (Speed, int recommended)
    )
```
As an example:
```lua
newPlayer = playerLib.new(world, 20, 20, 10, 4, 100)
```
---
We will require the following methods for the player to work correctly:

```lua
function love.update(dt)
    newPlayer:update(dt)
    --world:update(dt) Should go after 
end

function love.draw()
    newPlayer:draw()
end
```

