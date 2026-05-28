extends Node

var player: Player;
var movement: FishermanMovement; # main  movement script
var currently_dashing: bool # is the player in a dashign state?

@export var dash_charge_length := 0.4; # how long does dash take to charge?
var dash_charge_timer: float = 0.0; # current charge prgoress

@export var dash_distance := 10.0; # how many units to dash
var dash_to_point: Vector2; # Point calculated by position + dash_direction * dash_dist
@export var dash_lerp_speed := 20.0; # speed that player moves from start to end of dash

var dash_start_pos: Vector2; # set when dash is activated

@export var dash_time_length := 0.5; # length of the actual dash
var dash_timer := 0.0;

var dash_overheld;



func _ready():
	player = owner as Player;
	movement = player.movement;

func _process(delta):
	var dash_held = player.controls.input.is_action_pressed("dash");

	if !dash_held:
		dash_charge_timer = 0.0;
		movement.set_movement_multiplier(1.0)
		player.animation.set_anticipating_dash(false);
	
	if dash_overheld:
		movement.set_movement_multiplier(1.0)
		player.animation.set_anticipating_dash(false);

	if(!dash_held && dash_overheld):
		dash_overheld = false;
		

	if(dash_overheld): return;

	var move_input: Vector2 = player.controls.get_move_input_vec();

	# print(str(currently_dashing));

	if (dash_held&&!currently_dashing):
		dash_charge_timer += delta;
		player.controls.rumble(0.05, 0.02)
		movement.set_movement_multiplier(0.5)

		player.animation.set_anticipating_dash(true);

		if (dash_charge_timer >= dash_charge_length):
			activate_dash(move_input);
			dash_charge_timer = 0

func _physics_process(delta):
	update_dash(delta)

func activate_dash(dash_direction: Vector2):

	currently_dashing = true;
	dash_charge_timer = 0;
	# dash_animation.play("dash");
	player.animation.dash();

	dash_to_point = movement.global_position + dash_direction.normalized() * dash_distance;
	dash_overheld = true;	
	dash_timer = 0.0;
	print("dash trigger!")
	print("Dash to: "+str(dash_to_point)+"Cur pos: "+str(movement.global_position)+"diff: "+str(dash_to_point - movement.global_position))
	dash_start_pos = movement.global_position;
	player.controls.rumble(0.2, 0.6)

	

func update_dash(delta):
	if (!currently_dashing): 
		return

	# debug_sprite.global_position = dash_to_point;

	#print("shitfuck")

	var dash_percent = dash_timer / dash_time_length;
	dash_timer += delta;
	# print(str(dash_percent))

	var next_dash_point = dash_start_pos.lerp(dash_to_point, dash_percent) # traverse along ine from start to end point
	var dash_delta = next_dash_point - movement.global_position;

	movement.toggle_movement_override(true);
	movement.override_movement(dash_delta, delta)

	if (dash_percent >= 1):
		movement.override_movement(dash_to_point - movement.global_position, delta)
		end_dash()

func end_dash():
	movement.toggle_movement_override(false);
	currently_dashing = false;
	print("dash end!")
