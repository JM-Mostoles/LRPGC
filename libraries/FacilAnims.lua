local facilAnims = {}

function facilAnims.new(image, hFrames, vFrames, speed, X, Y, oX, oY, from, to)
    local newAnimationObject = {}

    newAnimationObject.quads = {}
    newAnimationObject.index = 1
    newAnimationObject.currentFrame = newAnimationObject.quads[newAnimationObject.index]
    newAnimationObject.timer = 1

    for i = 1, hFrames do
        for j = 1, vFrames do
            table.insert(newAnimationObject.quads,
                love.graphics.newQuad(
                    ((j - 1) * (image:getWidth()  / hFrames)),
                    ((i - 1) * (image:getHeight()  / vFrames)),
                    (image:getWidth() / hFrames),
                    (image:getHeight() / vFrames),
                    image:getWidth() ,
                    image:getHeight()
                )
            )
        end
    end
    newAnimationObject.index = 1
    newAnimationObject.currentFrame = newAnimationObject.quads[newAnimationObject.index]

    function newAnimationObject:update(dt)
        newAnimationObject.timer = (newAnimationObject.timer + (speed * dt))
        newAnimationObject.index = math.floor(newAnimationObject.timer)
        newAnimationObject.currentFrame = newAnimationObject.quads[newAnimationObject.index]

        if newAnimationObject.index == #newAnimationObject.quads then
            newAnimationObject.timer = 1
            newAnimationObject.index = 1
        end
    end

    function newAnimationObject:play()
        love.graphics.draw(image, newAnimationObject.currentFrame, X, Y, 0, 1, 1, oX, oY)
    end

    return newAnimationObject
end

return facilAnims
