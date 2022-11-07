pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
function _init()
	c=0
	music(1)
	alien={x=64,y=113,spr(3),life=3}
	bar={x=64,y=120,spr(35)}
	move_alien=false
	astro1={x=rnd(112),y=(8+rnd(70)),sprite=4}
	astro2={x=rnd(112),y=(8+rnd(70)),sprite=6}
	astro3={x=rnd(112),y=(8+rnd(70)),sprite=8}
	astro4={x=rnd(112),y=(8+rnd(70)),sprite=4}
	astro5={x=rnd(112),y=(8+rnd(70)),sprite=6}
	astro6={x=rnd(112),y=(8+rnd(70)),sprite=8}
	astro7={x=rnd(112),y=(8+rnd(70)),sprite=4}
	astro8={x=rnd(112),y=(8+rnd(70)),sprite=6}
	astro9={x=rnd(112),y=(8+rnd(70)),sprite=8}
	astro10={x=rnd(112),y=(8+rnd(70)),sprite=4}
	astro11={x=rnd(112),y=(8+rnd(70)),sprite=6}
	astro12={x=rnd(112),y=(8+rnd(70)),sprite=8}
	astronautes={astro1,astro2,astro3,astro4,astro5,astro6,astro7,astro8,astro9,astro10,astro11,astro12}
	create_stars()
	explosions={}
end


function _update()
	update_stars()
	if btn(➡️)  then
		if move_alien then
		 bar.x+=2
 	else 
 		bar.x+=2 alien.x+=2
 	end
 end
 if btn(⬅️) then
		if move_alien then
		 bar.x-=2 
		else
			bar.x-=2 alien.x-=2
		end
	end 	
	if (btn(❎)) move_alien=true
	if (move_alien) bounce()
 kill()
 lost_life()
 update_explosions()
end

function _draw()
	cls()
	map(0,0,0,0,128,128)
	draw_stars()
	spr(3,alien.x,alien.y)
	spr(35,bar.x,bar.y,2,1)
	spr(astro1.sprite+time()%2,astro1.x,astro1.y)
	spr(astro2.sprite+time()%2,astro2.x,astro2.y)
	spr(astro3.sprite+time()%2,astro3.x,astro3.y)
	spr(astro4.sprite+time()%2,astro4.x,astro4.y)
	spr(astro5.sprite+time()%2,astro5.x,astro5.y)
	spr(astro6.sprite+time()%2,astro6.x,astro6.y)
	spr(astro7.sprite+time()%2,astro7.x,astro7.y)
	spr(astro8.sprite+time()%2,astro8.x,astro8.y)
	spr(astro9.sprite+time()%2,astro9.x,astro9.y)
	spr(astro10.sprite+time()%2,astro10.x,astro10.y)
	spr(astro11.sprite+time()%2,astro11.x,astro11.y)
	spr(astro12.sprite+time()%2,astro12.x,astro12.y)
	movement_bar()	
	draw_explosions()
	message()
	show_life()
end
-->8
-- collision

function collision(a,b)
	if a.x>b.x+8
	or a.y>b.y+8
	or a.x+8<b.x
	or a.y+8<b.y then
		return false
	else
		return true 
	end
end

function collision(alien,bar)
	if alien.x>bar.x+16
	or alien.y>bar.y+8
	or alien.x+8<bar.x
	or alien.y+8<bar.y then
		return false
	else
		return true
	end
end
-->8
-- lancer de l'alien
function update_alien()
	alien.x-=1
	alien.y-=1
end



function launch()
	if btn(❎) and alien.x==bar.x and alien.y==113 then
		update_alien()
	end	 
end

-->8
-- rebond
--direction alien droite ou gauche
function left_or_right()
	local z
	local lor=flr(rnd(2))
	if lor==0 then 
		z=-3
	else
		z=3
	end
	return z
end

dx=left_or_right()
dy=-3

function bounce()
		alien.x += dx
		alien.y += dy
		if alien.x<0
	 or alien.x>120
	 or collision(alien,astro1)
	 or collision(alien,astro2)
	 or collision(alien,astro3)
	 or collision(alien,astro4)
	 or collision(alien,astro5)
	 or collision(alien,astro6)
	 or collision(alien,astro7)
	 or collision(alien,astro8)
	 or collision(alien,astro9)
	 or collision(alien,astro10)
	 or collision(alien,astro11)
	 or collision(alien,astro12) then
			dx=-dx
		end
		if alien.y<8
	 or collision(alien,bar)
	 or collision(alien,astro1)
	 or collision(alien,astro2)
	 or collision(alien,astro3) 
	 or collision(alien,astro4)
	 or collision(alien,astro5)
	 or collision(alien,astro6)
	 or collision(alien,astro7)
	 or collision(alien,astro8)
	 or collision(alien,astro9)
	 or collision(alien,astro10)
	 or collision(alien,astro11)
	 or collision(alien,astro12)	 then
			dy=-dy
		end
		if collision(alien,astro1)
	 or collision(alien,astro2)
	 or collision(alien,astro3) 
	 or collision(alien,astro4)
	 or collision(alien,astro5)
	 or collision(alien,astro6)
	 or collision(alien,astro7)
	 or collision(alien,astro8)
	 or collision(alien,astro9)
	 or collision(alien,astro10)
	 or collision(alien,astro11)
	 or collision(alien,astro12)	then
	 create_explosion(alien.x+4,alien.y+4)
	 end
end










-->8
--mouvement de la barre
function movement_bar()
	if bar.x<0 and not move_alien then
		bar.x=0 alien.x=0
	end
	if bar.x>112 and not move_alien then
	 bar.x=112 alien.x=112
	end
	if bar.x<0 and move_alien then
		bar.x=0
	end
	if bar.x>112 and move_alien then
		bar.x=112
	end
end
-->8
--relance du jeu et systme vie
function show_life()
	print(""..alien.life,122,2,10)
	end
	
function lost_life()
	if c<=0 then
		if alien.y>128 and alien.life==3 then
				c=20
				restart()
		end
		if alien.y>128 and alien.life==2 then
				c=20
				restart1()
		end
	end
end
	
function restart()
	_init()
	alien.life-=1
	dx=left_or_right()
	dy=-3
end

function restart1()
	c=0
	alien={x=64,y=113,spr(3),life=1}
	bar={x=64,y=120,spr(35)}
	move_alien=false
	astro1={x=rnd(112),y=(8+rnd(70)),sprite=4}
	astro2={x=rnd(112),y=(8+rnd(70)),sprite=6}
	astro3={x=rnd(112),y=(8+rnd(70)),sprite=8}
	astro4={x=rnd(112),y=(8+rnd(70)),sprite=4}
	astro5={x=rnd(112),y=(8+rnd(70)),sprite=6}
	astro6={x=rnd(112),y=(8+rnd(70)),sprite=8}
	astro7={x=rnd(112),y=(8+rnd(70)),sprite=4}
	astro8={x=rnd(112),y=(8+rnd(70)),sprite=6}
	astro9={x=rnd(112),y=(8+rnd(70)),sprite=8}
	astro10={x=rnd(112),y=(8+rnd(70)),sprite=4}
	astro11={x=rnd(112),y=(8+rnd(70)),sprite=6}
	astro12={x=rnd(112),y=(8+rnd(70)),sprite=8}
	astronautes={astro1,astro2,astro3,astro4,astro5,astro6,astro7,astro8,astro9,astro10,astro11,astro12}
	create_stars()
	dx=left_or_right()
	dy=-3
end

-->8
--elimination astro

function kill()
	for astro in all(astronautes) do
		if collision(alien,astro) then
			astro.sprite=37
			astro.x=0
			astro.y=0	
		end
	end
end
-->8
--message gagne  et perdu

function message()
		if astro1.x==0 and astro2.x==0 and astro3.x==0 and astro4.x==0 and astro5.x==0 and astro6.x==0 and astro7.x==0 and astro8.x==0 and astro9.x==0 and astro10.x==0 and astro11.x==0 and astro12.x==0 then
			spr(48,40,64,8,24)
			alien.x=10
			alien.y=10
			if btn(⬇️) then
				_init()
			end
		end
		if alien.y>128 and alien.life==1 then
			alien.life=0
		end
		if alien.life==0 then
			spr(56,40,64,8,56)
		end
		if btn(⬇️) and alien.life==0 then
			_init()
		end 
end

-->8
-- animations

--init stars
function create_stars()
	stars={}
	for i=1,15 do 
		new_stars={
			x=rnd(128),
			y=rnd(128),
			col=rnd{7,9,10},
			speed=1+rnd(3),
			}
			add(stars,new_stars)
			end
		end
		
-- update stars
function update_stars()
	for s in all(stars) do
		s.y += s.speed
		if s.y > 128 then 
			s.y=0
			s.x=rnd(128)
	 end
 end 
end 
	
-- update stars
function draw_stars()
 for s in all(stars) do 
 	pset(s.x,s.y,s.col,s.speed)
 	end
 end 
 

-->8
-- explosions 

function create_explosion(x,y)
	sfx(1)
	add(explosions,{x=x,
																	y=y,
																	timer=0})
end

function update_explosions()
	for e in all(explosions) do
		e.timer+=1
		if e.timer==13 then
			del(explosions,e)
		end
	end
end

function draw_explosions()
	circ(x,y,rayon,couleur)
	for e in all(explosions) do
		circ(e.x,e.y,e.timer/3,
							8+e.timer%3)
	end
end
__gfx__
00000000000000000000000000000000000040000000040000004000000004000000400000000400000000007000000077777777000000077777777777777777
00000000000000000000000000000000077777000077777007777700007777700777770000777770000000007000000000000000000000070000000770000000
00700700000000000000000003033303078887000078887007ccc700007ccc700733370000733370000000007000000000000000000000070000000770000000
000770000000000000000000003bbb30077777000077777007777700007777700777770000777770000000007000000000000000000000070000000770000000
00077000066666666666666003b0a0b3006960000f06960f006960000f06960ff06960f000069600000000007000000000000000000000070000000770000000
00700700644444aaaa444446003bbb300f666f0000f666f00f666f0000f666f00f666f0000f666f0000000007000000000000000000000070000000770000000
00000000655555555555555600030300f06060f000060600f06060f000060600006060000f06060f000000007000000000000000000000070000000770000000
00000000666666666666666600003000008080000008080000c0c000000c0c000030300000030300000000007000000000000000000000070000000770000000
00000000000007770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007770700070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000007770070700000000000000000000077700000770000000770000007770000777000000777000007770000077700007777700007770077770000
0000000000000777000a000000000000000a00000070770000770000000770000077000000707700007707000077070000770700000077000077000007700000
000000000000077700707000000700000000a0000070770000770000000770000077700000707700007777000077000000770700000077000077000007700000
00000000000007770700070000000000000000000077770000770000000770000077000000707700007700000077000000770700000077000077000007700000
77777777000007770000000000000000000000000070770000777700000770000077770000707700007700000077000000777700007777000077770007700000
77777777000007770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777777000000000000000006666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
777777770000000000000000644444aaaa4444460000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000065555555555555560000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000066666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b0000b0000bbb00000b0b00000000000bb0b0b0000bb00000bbb00000000000000b0000000bbb00000bbb0000bbbb00000bbb00000bbb00000bb00000000000
00b00b0000bb0b0000bb0b00000000000bb0b0b0000bb00000b0bb000000000000bb000000bb0b0000bb0b0000bb000000bb000000bb0b00000bb00000000000
000bb00000bb0b0000bb0b00000000000bb0b0b0000bb00000b0bb000000000000bb000000bb0b0000bb0b0000bbbb0000bbb00000bb0000000bb00000000000
000bb00000bb0b0000bb0b00000000000bb0b0b0000bb00000b0bb000000000000bb000000bb0b0000bb0b0000000b0000bb000000bb0000000bb00000000000
000bb00000bbbb0000bbbb000000000000bbbbb0000bb00000b0bb000000000000bbbb0000bbbb0000bbbb0000bbbb0000bbbb0000bb00000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000bb00000000000
__gff__
0000000000000000000000010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
1516171819001a1b1c1d181e1f00032600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b2a2a2a2a2a2a2a2a2a2a2a2a2a2a0d0e2c2c2c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b37373737373737373737373737260d0d2c2c2c2c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b37373737373737373737373737260d0d2c2c2c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b373737373737373737373737372c0d0d2c2c2c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b373737373737373737373737372c0d0d2c2c2c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b373737373737373737373737372c0d0d2c2c2b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b37373737373737373737373726260d0d2b2b2b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b37373737373737262626262626260d0d2b2b2b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b37373737373737262626262626260d0d2b2b2b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b37373737373737372626262626260d0d2b2b2b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b37373737373737372626262626260d0d2b2b2b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b37373737373737373737372b2b2b0d0d2b2b2b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b3737373737373737373737372b2b0d0d2b2b2b2b0023000000340000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b37373737373737373737292929290d29292929000023000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0b37373737373737373737373729290d29292929000023000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f292929292929000023233400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f292929292929000023232323000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f000023232323230000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f000023232323230000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000232323232323232323002323232323230000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000023232323230000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
011700002915029150000002915029150000002915029150000002915029150000002815028150000002815028150000002915029150000002415024150000000000000000000000000000000000000000000000
000600002f33028330283302f3302833028330303302f33028330283302f3302833028330303302f3302833000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000002f33000000283300000028330000002f330000002833000000283300000030330000002d330000002f330000002833000000000000000000000000000000000000000000000000000000000000000000
__music__
00 43414344
03 00424344
03 03424344

