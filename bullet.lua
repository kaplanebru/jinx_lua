Bullet = Object:extend()

function Bullet:new(x, y, width, heigth)
    self.x = x
    self.y = y
    self.o = o
    self.width = 10
    self.heigth = 20
    self.speed = 200 
    self.angle = 0
    self.directionX = 1
    self.directionY = 1
end

function Bullet:update(dt)

    --self.y = self.y + self.speed * dt
    self.x = self.x +self.speed * dt
   
end

function Bullet:draw()
    love.graphics.rectangle("fill", self.x, self.y, 10, 20)
end