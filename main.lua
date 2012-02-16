
function love.load()
	love.graphics.setColor(0,0,0)
	love.graphics.setBackgroundColor( 255, 255, 255 )
	car = love.graphics.newImage("car.png")
	x = 150
	y = 150
	angle = 90
	speed = 1
	maxspeed = 100
	angledif = 10
	salto=10
	width = car:getWidth()
   	height = car:getHeight()
end

function love.update(dt)
   if love.keyboard.isDown("right") then
		angle = angle + angledif
   elseif love.keyboard.isDown("left") then
		angle = angle - angledif
   end
	if angle > 360 then
		angle = 0
	end
	if angle < -360 then
		angle = 0
	end
	scale_x = math.cos(math.rad(angle+90))
	scale_y	= math.sin(math.rad(angle+90))
	velocity_x = speed * scale_x
	velocity_y = speed * scale_y

   if love.keyboard.isDown("down") then
      y = y + velocity_y
      x = x + velocity_x
   elseif love.keyboard.isDown("up") then
      y = y - velocity_y
      x = x - velocity_x
   end

end

function love.draw()
	love.graphics.draw(car, x, y, math.rad(angle), 1, 1, width/2, height/2 )
	love.graphics.print("Angle: " .. angle,10,20)
	love.graphics.print("Speed: " .. speed,10,40)
	love.graphics.print("X_Velocity: " .. velocity_x,10,60)
	love.graphics.print("Y_Velocity: " .. velocity_y,10,80)
	love.graphics.print("sen: " .. math.sin(angle),10,100)
	love.graphics.print("cos: " .. math.cos(angle),10,120)
end
