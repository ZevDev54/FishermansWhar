extends Node

var player : Player;
var movement : FishermanMovement; # main  movement script
var currently_dashing : bool # is the player in a dashign state?

@export var dash_charge_length := 0.4; # how long does dash take to charge?
var dash_charge_timer; # current charge prgoress


@export var dash_distance := 10.0; # how many units to dash
var dash_to_point : Vector2; # Point calculated by position + dash_direction * dash_dist
@export var dash_lerp_speed := 20.0; # speed that player moves from start to end of dash


var dash_start_pos : Vector2; # set when dash is activated

@export var dash_time_length := 0.2; # length of the actual dash
var dash_timer := 0.0;

func _ready():
    player = owner as Player;
    movement = player.movement;


func _process(delta):
    var dash_held = player.controls.input.is_action_pressed("dash");
    var move_input : Vector2 = player.controls.get_move_input_vec();

    if(dash_held & !currently_dashing):
        dash_charge_timer += delta;

        if(dash_charge_timer >= dash_charge_length):
            activate_dash(move_input);

func _physics_process(delta):
    update_dash(delta)

func activate_dash(dash_direction : Vector2):

    currently_dashing = true;
    dash_to_point = movement.global_position + dash_direction * dash_distance;

func update_dash(delta):
    movement.toggle_movement_override(true);

    var dash_percent = dash_timer / dash_time_length;
    dash_timer += delta;


    var next_dash_point = dash_start_pos.lerp(dash_to_point, dash_percent) # traverse along ine from start to end point
    var dash_delta = movement.global_position - next_dash_point;


    movement.override_movement(dash_delta, delta)

    if(dash_percent >= 1):
        end_dash()
    

    


func end_dash():
    movement.toggle_movement_override(false);
    currently_dashing = false;
