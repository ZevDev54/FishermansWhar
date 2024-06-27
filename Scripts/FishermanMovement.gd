extends RigidBody2D
class_name FishermanMovement;


var player : Player;


@export var accel : float = 1000.0;
@export var decel = 0.5;
@export var max_speed : float = 200.0;
@export var change_dot_multiplier = 1.0;

var controls;

@onready var weapon = $Weapon;

func _ready():
	player = owner as Player
	controls = player.controls;


func _physics_process(delta):
	var move_vec : Vector2 = controls.get_move_vec();

	player.animation.set_running(move_vec.length() > 0);

	# global_position += Vector2(x,y) * speed * delta;

	if(move_vec.length() > 0):
		var spd = self.linear_velocity.length();
		print(spd);
		var movement = move_vec.normalized() * accel;
		

		if(spd < max_speed):
			apply_impulse(movement * delta)
	else:
		var velocityCopy = linear_velocity;
		var slowdownVector : Vector2 = velocityCopy.lerp(Vector2.ZERO, delta); 
		apply_central_force(-slowdownVector * decel) 
	

	# move_and_collide(global_position);

