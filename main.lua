-- Tutorial 1: Hamster Ball
-- Add an image to the game and move it around using 
-- the arrow keys.
-- compatible with löve 0.6.0 and up

function love.load()
	love.graphics.setColor(0,0,0)
	love.graphics.setBackgroundColor( 255, 255, 255 )
	car = love.graphics.newImage("car.png")
	x = 50
	y = 50
	angle = 0
	speed = 20
	angledif = 2
	anglemax = 60
	salto=10
	width = car:getWidth()
   	height = car:getHeight()
end

function love.update(dt)
   if love.keyboard.isDown("right") then
      -- x = x + (speed * dt)
		angle = angle + angledif
   elseif love.keyboard.isDown("left") then
      -- x = x - (speed * dt)
		angle = angle - angledif
   end

   if love.keyboard.isDown("down") then
		calculaxy()
   --   y = y + (speed * dt)
		dta=dt
   elseif love.keyboard.isDown("up") then
   --   y = y - (speed * dt)
		calculaxy()
		dta=dt
   end
	if angle > anglemax then
		angle = anglemax
	end
	if angle < -anglemax then
		angle = -anglemax
	end
	

end

function calculaxy()
	porc=100*angle/90
	tx=porc
	ty=100-tx

	px = tx*salto/100
	py = ty*salto/100

	x=x+px
	y=y+py
end
function love.draw()
	love.graphics.draw(car, x, y, math.rad(angle), 1, 1, width/2, height/2 )
	love.graphics.print("Angle: " .. angle .. "  X,Y " .. x .. "," .. y,10,20)
	--love.graphics.print("dt: " .. dta,10,40)
end
