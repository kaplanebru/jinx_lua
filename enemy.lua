function love.load()
    Object = require "classic"
end

Enemy = Object:extend()

function Enemy:new(x, y, radius)
    self.x = x
    self.y = y
    self.radius = radius
    self.speed = 200
    self.move = true   
end


function Enemy.update(self, dt)
    Enemy.move(self, dt)
end

function Enemy.move(self, dt)
    if self.move then
        self.x = self.x + self.speed * dt
    end

    if self.x > WIDTH - self.radius 
    or self.x < 0 + self.radius
    or self.y > HEIGHT - self.radius
    or self.y < 0 + self.radius then
        self.speed = - self.speed
    end
end

function Enemy.draw(self)
    love.graphics.circle("line", self.x, self.y, self.radius)
end



function Enemy:circleRectangleIntersect(rx, ry, rw, rh)
	local circle_distance_x = math.abs(self.x - rx - rw/2)
	local circle_distance_y = math.abs(self.y - ry - rh/2)

	if circle_distance_x > (rw/2 + self.radius) then return false end
	if circle_distance_y > (rh/2 + self.radius) then return false end

	if circle_distance_x <= (rw/2) then return true end
	if circle_distance_y <= (rh/2) then return true end

	local corner_distance_sq = math.pow(circle_distance_x - rw/2, 2) + math.pow(circle_distance_y - rh/2, 2)

	return corner_distance_sq <= math.pow(self.radius, 2)
end