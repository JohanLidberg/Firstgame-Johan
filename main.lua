
function love.keypressed(key)
  if key == "escape" then
    love.event.push("quit")
  end
end

function love.draw(dt)

end

function love.load()
  world = love.physics.newWorld(0, 600, true)
  ball = {}
  ball.b = love.physics.newBody(world, 400, 200, "dynamic")
  ball.b:setMass(20)                     
  ball.s = love.physics.newCircleShape(20)
  ball.f = love.physics.newFixture(ball.b, ball.s)

block = {}
  block.b = love.physics.newBody(world, 400, 500, "static")
  block.s = love.physics.newRectangleShape(200, 50)
  block.f = love.physics.newFixture(block.b, block.s)
  block.f:setUserData("Block")

  block.a = love.physics.newBody(world, 100, 500, "static")
  block.c = love.physics.newRectangleShape(200, 50)
  block.q = love.physics.newFixture(block.a, block.c)
  block.f:setUserData("Block")

  block.y = love.physics.newBody(world, 250, 300, "static")
  block.t = love.physics.newRectangleShape(200, 50)
  block.i = love.physics.newFixture(block.y, block.t)
  block.f:setUserData("Block")
end

function love.update(dt)
  world:update(dt)

  if love.keyboard.isDown("d") then
    ball.b:applyForce(100, 0)
  elseif love.keyboard.isDown("a") then
    ball.b:applyForce(-100, 0)
  end
  if love.keyboard.isDown("w") then
    ball.b:applyForce(100, -1000)
  elseif love.keyboard.isDown("s") then
    ball.b:applyForce(0, 1000)
end

end

function love.draw()
  love.graphics.setBackgroundColor{0, 0, 1, 1}

  love.graphics.setColor(1 ,1 , 1)
  love.graphics.circle("fill", ball.b:getX(),ball.b:getY(), ball.s:getRadius(),20 )

  love.graphics.setColor{0, 1, 0, 1}
  love.graphics.polygon("fill", block():getWorldPoints(block:getPoints()))

  love.graphics.setColor{0, 1, 0, 1}
  love.graphics.polygon("fill", block.a:getWorldPoints(block.c:getPoints()))

  love.graphics.setColor{0, 1, 0, 1}
  love.graphics.polygon("fill", block.y:getWorldPoints(block.t:getPoints()))
end
