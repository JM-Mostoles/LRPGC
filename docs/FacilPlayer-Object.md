# FacilPlayer and FacilObject

## Preamble
FacilPlayer and FacilObject are simple wrap ups of love.physics, made easier to instanciate and with prebuilt features, such as a movement for the player. Notice these 2 should be used as templates for your own objects since they lack texture/ image. Of course, feel free to modify these libraries as you desire.

## Usage
### Creating a new world with love.physics
These 2 libraries recieve a world as an argument. To create one, we do the following:
```lua
local world = love.physics.newWorld(0, 0, true)
```
Please do notice, world needs the update methods :update(dt) in our update function.
```lua
function love.update(dt)
    world:update(dt)
end
```
---
### Creating a new player with FacilPlayer
We must pass the following arguments to the .newColliderPlayer function:
```lua
newPlayer = playerLib.newColliderPlayer(
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
newPlayer = playerLib.newColliderPlayer(world, 20, 20, 10, 4, 100)
```

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
---
### Creating a new collisioning object with FacilObject

FacilObject works in a similar way as FacilPlayer. No need to update it, as only creating it in the world will be more than enough in order to make the player collide, drawing it is not necessary, however, we will be doing it for this example.

To create a collisioning object, we call the .newColliderObject method with the following parameters;

```lua
local objectLib = require("libraries.FacilObject")
newObject = objectLib.newColliderObject(
    world, 
    (Position in X, int recommended), 
    (Position in Y, int recommended), 
    (Width, int recommended), 
    (Height, int recommended)
    )
```

And we can draw the object with 

```lua
function love.draw()
    newObject:draw()
end
```

And with that, we now have an object created!

## Example of full usage

```lua

-- Main.lua

local playerLib = require("libraries.FacilPlayer")
local objectLib = require("libraries.FacilObject")

local world
local newPlayer
local newObject

function love.load()
    world = love.physics.newWorld(0, 0, true)
    newPlayer = playerLib.newColliderPlayer(world, 20, 20, 10, 4, 100)
    newObject = objectLib.newColliderObject(world, 90, 80, 30, 30)
end

function love.update(dt)
    newPlayer:update(dt)
    world:update(dt)
end

function love.keypressed(key)

end

function love.draw()
    newPlayer:draw()
    newObject:draw()

end

```