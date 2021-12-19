function love.load()

    WIDTH, HEIGHT, FLAGS = love.window.getMode()
    Enemy = {}
    Enemy.x = WIDTH/2
    Enemy.y = HEIGHT/2
    Enemy.radius = 50

    EnPowerups = {}

    Player = {}
    Player.x = WIDTH/2 + 2*Enemy.radius
    Player.y = HEIGHT/2 + 2*Enemy.radius
    Enemy.move = true

end

function love.update(dt)

    local speed = 300
    love.moveEnemy(dt, speed)
    love.movePlayer(dt, speed)
    
end

function love.movePlayer(dt, speed)

    if love.keyboard.isDown("right") then   
        if Player.x < WIDTH - 50 then
            Player.x = Player.x + speed * dt
        end
    end

    if love.keyboard.isDown("left") then
        if Player.x > 0 then
            Player.x = Player.x - speed * dt
        end
    end

    if love.keyboard.isDown("up") then
        if Player.y > 0 then
            Player.y = Player.y - speed * dt
        end
    end

    if love.keyboard.isDown("down") then
        if Player.y < HEIGHT - 50 then
            Player.y = Player.y + speed * dt
        end
    end
    
end

function love.moveEnemy(dt, speed)

    if Enemy.move then
        Enemy.x = Enemy.x + speed * dt
    end
    
    if Enemy.x > WIDTH - Enemy.radius 
    or Enemy.x < 0 + Enemy.radius
    or Enemy.y > HEIGHT - Enemy.radius
    or Enemy.y < 0 + Enemy.radius then
        Enemy.move = false
    end

end

function CreateEnPowerUp()



    

end

function love.draw()
    love.graphics.circle("line", Enemy.x, Enemy.y, Enemy.radius)
    love.graphics.rectangle("fill", Player.x, Player.y, 50, 50)
end