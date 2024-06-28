extends Node

var player : Player;
@export var dash_speed : float = 200;
@export var dash_length := 0.3;
var dash_timer : float = 0;
var dash_dir = Vector2.RIGHT;




func _ready():
	player = owner as Player;


func _process(delta):
	if player.controls.input.is_action_just_pressed("dash"):
		activate_dash();

	if dash_timer >= 0:
		dash_loop(delta);
	else:
		player.movement.toggle_movement_override(false); 



func activate_dash():
	var move_input : Vector2 = player.controls.get_move_input_vec();
	if(move_input.length() > 0):
		dash_timer = dash_length;
		dash_dir = move_input;
	

func dash_loop(delta):
	player.movement.toggle_movement_override(false); 
	player.movement.override_movement(dash_dir * dash_speed, delta);
	dash_timer -= delta;
