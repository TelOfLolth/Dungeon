function _init()
player = {}
player.x = 60
player.y = 100
player.sprite = 1
player.speed = 1
end

function _update()

if btn(0) then
if(solid_tile(player.x-1, player.y) == false) then
    player.x -= player.speed
    move()
  end

  if btn(1) then
	if(solid_tile(player.x+8, player.y) == false) then
    player.x += player.speed
    move()
end
  end

  if btn(2) then
	if(solid_tile(player.x, player.y-1) == false) then
    player.y -= player.speed
    move()
	end
end
  end

  if btn(3) then
if(solid_tile(player.x, player.y+8) == false) then
    player.y += player.speed
    move()
end
  end

  if not player.moving then
    player.sprite = 1
  end
  
  if btn(0) then
  player.sprite = 1 
  sfx(0)
  end
  if btn(1) then
  player.sprite = 2
   sfx(0)
  end
  if btn(2) then
   sfx(0)
  end
if btn(3) then
    sfx(0)
  
end

			end
			
			
function _draw()
			
				if btn(4) then
			add_new_bullet()
				end
			
  cls()
  	map(0,0,0,0,16,16)
  	spr(player.sprite,player.x,player.y)
			spr(20,56,112)
			spr(21,64,112)
			
			function _draw()
				for b in all(bullet) do
					b:draw()
				end
				
				end
			
		
end

function move()
  player.moving = true
  player.sprite += 1
  if player.sprite > 3 then
   player.sprite = 1
  end
end

function solid_tile(x, y)
	local tilex = ((x - (x % 8)) / 8)
	local tiley = ((y - (y % 8)) / 8)

	if(fget(mget(tilex, tiley), 0)) then
 	return true
 else
 	return false
 end	
	
end

