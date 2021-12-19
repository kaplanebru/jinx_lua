function love.load()

    Object = require("classic")
    require("enemy")
    require("player")
    require("bullet")

    WIDTH, HEIGHT, FLAGS = love.window.getMode()
    --print("yoko")
    
    Enm1 = Enemy(WIDTH/2, HEIGHT/2, 50)
    enm2 = Enemy(100, 100, 30)
    player = Player(WIDTH/2 + 2*Enm1.radius, HEIGHT/2 + 2*enm2.radius, 0.5, 0.5)
    bulletList = {}
end

function love.update(dt)
    Enm1:update(dt)
    enm2:update(dt)
    player:update(dt)

    for i,v in ipairs(bulletList) do
         -- v burda bullet1, yani bullet1:update(dt) aslında
            v:update(dt)

        if Enm1:circleRectangleIntersect(v.x, v.y, v.width, v.heigth) then
            Enm1.radius = Enm1.radius - 5 
            --veya enm1.radius * 0.5
            --COLLISIONA TIMER EKLE KI SONSUZ KUCULMESIN
        end
    end
end

function love.draw()
    Enm1:draw()
    enm2:draw()
    player:draw(0.5, 0.5)
    for i,v in ipairs(bulletList) do
        v:draw()
    end
    
end

function love.keypressed(key)
    player:keyPressed(key, Enm1)
end


