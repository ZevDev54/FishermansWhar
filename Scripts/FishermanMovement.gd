extends CharacterBody2D
class_name FishermanMovement;


var player : Player;

var input_velocity = Vector2.ZERO;
@export var max_speed = 200.0;
@export var accel = 2000.0;
@export var decel = 10.0;
var vel : Vector2 = Vector2.ZERO;

var special_vel := Vector2.ZERO;
var special_vel_drag = 0.98;

var movement_overridden := false;
var move_multiplier := 1.0; # multiplies all movement, acts as an interface for other nodes to cripple/speed up player.

@onready var weapon = $Weapon;

func _ready():
	player = owner as Player



func _physics_process(delta):
	if movement_overridden: return;

	var move_vec = player.controls.get_move_input_vec();
	player.animation.set_running(move_vec.length() > 0);

	var raw_movement : Vector2 = move_vec.normalized() * accel * move_multiplier * delta;

	# if((vel + raw_movement).length() < max_speed):
	# 	vel += raw_movement;

	vel += raw_movement;
	if(vel.length() > max_speed):
		vel = vel.normalized() * max_speed # Clamp velocity so it is less than max speed
		
	if(move_vec.length() == 0):
		vel = vel.lerp(Vector2.ZERO, decel * delta)

	






	velocity = vel + special_vel; # Set velocity, integrate special velocity from dash, recoil.

	special_vel *= special_vel_drag; # Drag special vec.

	# global_position += vel * delta

	move_and_slide();


# func special_impulse(force:Vector2):
# 	special_vel += force;

func set_movement_multiplier(multiplier):
	move_multiplier = multiplier;

func toggle_movement_override(toggle:bool):
	movement_overridden = toggle;

func override_movement(move_vec : Vector2, delta):
	global_position += move_vec * delta;
	move_and_slide();
	# print("augh!")

func move_to_position(pos:Vector2):

	global_position = pos;
	print("instant movement!");
	velocity = Vector2.ZERO;
	move_and_slide();
