if ysp < 5//gravity
{
	ysp += 0.1
}

//wraps the player around the screen
move_wrap(true, true, 16)

//both this and the next if slow down the player
if xsp > 0
{
	xsp-=dacc
}
if xsp < 0
{
	xsp+=dacc
}

//moves player left, checking for top speed
if keyboard_check(vk_left) and xsp > -topsp
{
	xsp -= acc
}

//moves player right, checking for top speed
if keyboard_check(vk_right) and xsp < +topsp
{
	xsp += acc
}

//checks for collision and cuts vertical momentum
if place_meeting(x, y+1, oSolid)
{
	ysp = 0
	
	//allows player to jump
	if keyboard_check(vk_up)
	{
		ysp = -2
	}
}

//applys all of the changes to the player's position
move_and_collide(xsp, ysp, oSolid)

//finishes the level when touching flag
if (place_meeting(x, y, oFlag))
{
	room_goto_next();
}

//death
if (place_meeting(x, y, Object4))
{
	room_restart();
}