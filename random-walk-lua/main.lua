local RandomWalker = require('randomWalker')
local randomWalks = {}
local canvas

function love.load()
    local potentialColors = {
        {255, 1, 1},
        {1, 255, 1},
        {1, 1, 255}
    }

    for i = 1, 5 do
        local config = {}
        
        config.x = love.math.random(0, love.graphics.getWidth())
        config.y = love.math.random(0, love.graphics.getHeight())
        config.color = chooseRandom(potentialColors)
        table.insert(randomWalks, RandomWalker(config))
    end

    canvas = love.graphics.newCanvas()
end

function love.draw()
    love.graphics.setCanvas(canvas)
        for i, randomWalk in ipairs(randomWalks) do
            love.graphics.setColor(randomWalk.getColor())
            love.graphics.circle('fill', randomWalk.getX(), randomWalk.getY(), randomWalk.radius)
        end
    love.graphics.setCanvas()

    love.graphics.draw(canvas)
end

function love.update(delta)
    for i, randomWalk in ipairs(randomWalks) do
        randomWalk.move(direction)
    end
end

function chooseRandom(t)
    return t[love.math.random(table.getn(t))]
end
