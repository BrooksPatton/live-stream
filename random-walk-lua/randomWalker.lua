function RandomWalker(start)
    local x = start.x
    local y = start.y
    local color = start.color
    local radius = 2

    function move()
        local direction = chooseRandomDirection()

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

    function getX()
        return x
    end

    function getY()
        return y
    end

    function getColor()
        return color
    end

    return {
        getColor = getColor,
        radius = radius,
        move = move,
        getX = getX,
        getY = getY
    }
end

return RandomWalker