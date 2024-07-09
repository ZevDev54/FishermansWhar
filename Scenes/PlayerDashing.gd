extends Node

var player : Player;

var dash_held := false;

@export var dash_speed : float = 200; # replace with charge min and max
@export var dash_length := 0.3;
var dash_timer : float = 0;
var dash_dir = Vector2.RIGHT;

@export var time_to_max_charge := 2.0; # seconds
var charge_timer := 0.0;
@export var charge_min := 0.0;
@export var charge_max := 0.4;
@export var min_player_charging_speed = 0.3;



func _ready():
	player = owner as Player;


func _process(delta):
	
	if dash_held:
		charge_timer += delta;
		var move_slowdown = clampf( 1-(charge_timer / time_to_max_charge),  min_player_charging_speed, 1)
		# var move_slowdown = 0.3;
		player.movement.set_movement_multiplier(move_slowdown)
		# print("dash held")
	elif dash_timer <= 0:
		player.movement.toggle_movement_override(false); 
		player.movement.set_movement_multiplier(1.0)
		# print("dash not held")

	if dash_held && !player.controls.input.is_action_pressed("dash"): # dash release instant
		activate_dash(clampf(charge_timer / time_to_max_charge, 0.0, 1.0));

	if dash_timer > 0:
		dash_loop(delta);

	dash_held = player.controls.input.is_action_pressed("dash");

	


		



func activate_dash(charge_level):
	var move_input : Vector2 = player.controls.get_move_input_vec();
	if(move_input.length() > 0):
		# dash_timer = dash_length;
		dash_dir = move_input;
		dash_timer = lerpf(charge_min, charge_max, charge_level);
		print(charge_level)
	charge_timer = 0;
	

func dash_loop(delta):
	player.movement.toggle_movement_override(false); 
	player.movement.override_movement(dash_dir * dash_speed, delta);
	dash_timer -= delta;
