extends Node2D
class_name PlayerWeapon;

@export var pickup_area : Area2D;
@export var owner_player : Player;


var weapon: FishWeapon;

var degrees: float = 0;

var input;

func _ready():
	input = owner_player.controls.input;



func _process(delta):
	var holding = (weapon != null)
	if(holding):
		weapon_update_loop();
	
	owner_player.animation.set_hands_active(!holding);
	
	weapon_pickup_loop();
		


func weapon_update_loop():
	var aim_x = input.get_axis("aim_left", "aim_right")
	var aim_y = input.get_axis("aim_up", "aim_down")
	weapon.aim_loop(aim_x, aim_y)

	# if(input.is_action_just_pressed("shoot")):
	# 	weapon.shoot();
	weapon.trigger_input = input.is_action_pressed("shoot");


#pickup weapon
func set_weapon(set):
	weapon = set;
	weapon.set_held_by(self, owner_player.unique_player_id)
	weapon.gfx.toggle_hands(true);
	weapon.aim_loop(1, 0)


#drop weapon
func drop_weapon():
	print("drop weapon called")
	if(weapon):
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
				drop_weapon();
				set_weapon(body as FishWeapon)
				print("Pickup weapon")

		


