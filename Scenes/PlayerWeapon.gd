extends Node2D

@export var pickup_area : Area2D;

var weapon: FishWeapon;

var degrees: float = 0;

var input;




func _process(delta):
	if(weapon):
		weapon_update_loop();
	
	weapon_pickup_loop();
		


func weapon_update_loop():
	var aim_x = input.get_axis("aim_left", "aim_right")
	var aim_y = input.get_axis("aim_up", "aim_down")
	
	var aim_vec = Vector2(aim_x, aim_y);

	if (aim_vec):
		#Rotate weapon
		var aim_rotation = atan2(aim_vec.y, aim_vec.x)
		weapon.global_rotation = aim_rotation;

		#degrees = lerp(degrees, atan2(aim_vec.x, aim_vec.y), rotateSpeed * delta)
		#weapon.global_rotation = degrees - 90;

		# set weapon flipped or not
		var aim_rotation_degrees = rad_to_deg(aim_rotation) + 180
		# print(aim_rotation_degrees)
		if (aim_rotation_degrees > 90&&aim_rotation_degrees < 270):
			weapon.gfx.toggle_flipped(false)
		else:
			weapon.gfx.toggle_flipped(true)

#pickup weapon
func set_weapon(set):
	weapon = set;
	weapon.holding_parent = self;
	weapon.gfx.toggle_hands(true);

#drop weapon
func drop_weapon():
	print("drop weapon called")
	weapon.drop();
	weapon = null;

func weapon_pickup_loop():
	if(input.is_action_just_pressed("drop") && weapon):
		print("Drop weapon")
		drop_weapon();
	

	if(input.is_action_just_pressed("pickup")):
		# print("pickup pressed!")
		var bodies = pickup_area.get_overlapping_bodies();

		for body in bodies:
			if(body is FishWeapon):
				set_weapon(body as FishWeapon)
				print("Pickup weapon")

		

		
