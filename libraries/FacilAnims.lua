local facilAnims = {}

function facilAnims.new(image, iWidth, iHeight, hFrames, vFrames, speed, X, Y, oX, oY)
    local newAnimationObject = {}

    newAnimationObject.quads = {}

    newAnimationObject.quads.currentFrame = 1

    for i = 1, hFrames do
        for j = 1, vFrames do
            table.insert(newAnimationObject.quads,
                love.graphics.newQuad(
                    ((j - 1) * (iWidth / hFrames)),
                    ((i - 1) * (iHeight / vFrames)),
                    (iWidth / hFrames),
                    (iHeight / vFrames),
                    iWidth,
                    iHeight
                )
            )
        end
    end

    function newAnimationObject:update(dt)
        self.currentFrame = self.currentFrame + (speed * dt)
        
    end

    function newAnimationObject:play()
        love.graphics.draw(image, self.currentFrame, self.X, self.Y, nil, 1, 1, self.oX. self.oY)
    end

    return newAnimationObject
end

return facilAnims
