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
	weapon.aim_loop(aim_x, aim_y)

	if(input.is_action_just_pressed("shoot")):
		weapon.shoot();


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

		


