Player = Object:extend()

function Player:new(x, y, scaleX, scaleY)
    self.image = love.graphics.newImage("gzkedi.png")
    self.x = x
    self.y = y
    self.width = self.image:getWidth() * scaleX
    self.heigth = self.image:getHeight() * scaleY
    self.speed = 200
    self.o = 0
    --self.angle = 0
end

function Player:update(dt)
    Player.move(self, dt)
end

function Player:draw(scaleX, scaleY)
    --love.graphics.rectangle("fill", self.x, self.y, self.width, self.heigth)
    love.graphics.draw(self.image, self.x, self.y, self.o, scaleX, scaleY, self.width/2, self.heigth/2)
end

function Player:move(dt)
    --[[mouse_x, mouse_y = love.mouse.getPosition()

    self.angle = math.atan2(mouse_y - self.y, mouse_x - self.x)
    cos = math.cos(self.angle)
    sin = math.sin(self.angle)

    self.x = self.x + self.speed * cos * dt
    self.y = self.y + self.speed * sin * dt

end --]]

    
    if love.keyboard.isDown("right") then   
        if self.x < WIDTH - self.width then
            self.x = self.x + self.speed * dt
        end
    end

    if love.keyboard.isDown("left") then
        if self.x > 0 then
            self.x = self.x - self.speed * dt
            
        end
    end

    if love.keyboard.isDown("up") then
        if self.y > 0 then
            self.y = self.y - self.speed * dt
            
        end
    end

    if love.keyboard.isDown("down") then
        if self.y < HEIGHT - self.heigth then
            self.y = self.y + self.speed * dt
        end
    end
end

function Player:keyPressed(key, target)
    if key == "space" then
        table.insert(bulletList, Bullet(self.x + self.width/2, self.y + self.heigth/2, 20, 10))
        self.angle = math.atan2(target.y - self.y, target.x - self.x)
        self.o = self.angle
    end
end


