local randomWalk

function love.load()
    randomWalk = RandomWalker({
        x = love.graphics.getWidth() / 2, 
        y = love.graphics.getHeight() / 2 
    })

    canvas = love.graphics.newCanvas()
end

function love.draw()
    love.graphics.setCanvas(canvas)
        love.graphics.setColor(randomWalk.color)
        love.graphics.circle('fill', randomWalk.x, randomWalk.y, randomWalk.radius)
    love.graphics.setCanvas()

    love.graphics.draw(canvas)
end

function love.update(delta)
    local direction = chooseRandomDirection()

    randomWalk.move(direction)
end

function chooseRandomDirection()
    local random = love.math.random(4)

    if random == 1 then 
        return 'left'
    elseif random == 2 then 
        return 'up'
    elseif random == 3 then 
        return 'right'
    else 
        return 'down'
    end
end

function RandomWalker(start)
    local x = start.x
    local y = start.y
    local color = { 255, 0, 0 }
    local radius = 2

    function move(direction)
        print(direction)
        if direction == 'right' then
            x = x + 1
        elseif direction == 'left' then
            x = x - 1
        elseif direction == 'up' then
            y = y - 1
        else
            y = y + 1
        end
    end

    return {
        x = x,
        y = y,
        color = color,
        radius = radius,
        move = move
    }
end
