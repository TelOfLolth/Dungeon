function _init()
	p = {}
	p.x = 60
	p.y = 100
	p.sprite = 1
	p.speed = 1
	
	e = {}
end

function _update()
-- Code for movement and collision checks
	if btn(0) then
		if(solid_tile(p.x-1, p.y) == false) then
			p.x -= p.speed
		end
	end

	if btn(1) then
		if(solid_tile(p.x+8, p.y) == false) then
			p.x += p.speed
		end
	end

	if btn(2) then
		if(solid_tile(p.x, p.y-1) == false) then
			p.y -= p.speed
		end
	end
	
	if btn(3) then
		if(solid_tile(p.x, p.y+8) == false) then
			p.y += p.speed
		end
	end

-- Movement audio and misc. actions related to movement
	if btn(0) then
		p.sprite = 1 
		sfx(0)
	end
	
	if btn(1) then
		p.sprite = 2
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
	cls()
	map(0,0,0,0,16,16)
	spr(p.sprite, p.x, p.y)
	spr(20,56,112)
	spr(21,64,112)
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

function enemy()
	spr(rnd(3)+17, rnd(112)+8, rnd(48))	
	add(e,{
			"hello",
			})
	print(e, 30, 122, 7)
end
