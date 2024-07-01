extends Node2D
class_name FishWeapon

@export var rigidbody : RigidBody2D;
@export var gfx : WeaponGfx;
@export var shoot_point : Node2D;
@export var projectile : PackedScene;
@export var projectile_speed := 200.0;
@export var projectile_damage = 20;
@export var projectile_lifetime := 2.0;

var trigger_input;

var holding_parent;
var holding_unique_id;
var aim_vec := Vector2.ZERO;

func aim_loop(set_aim_x, set_aim_y):
	var temp_aim = Vector2(set_aim_x, set_aim_y);

	if (temp_aim):
		aim_vec = temp_aim;
		#Rotate weapon
		var aim_rotation = atan2(aim_vec.y, aim_vec.x)
		global_rotation = aim_rotation;

		#degrees = lerp(degrees, atan2(aim_vec.x, aim_vec.y), rotateSpeed * delta)
		#weapon.global_rotation = degrees - 90;

		# set weapon flipped or not
		var aim_rotation_degrees = rad_to_deg(aim_rotation) + 180
		# print(aim_rotation_degrees)
		if (aim_rotation_degrees > 90&&aim_rotation_degrees < 270):
			gfx.toggle_flipped(false)
		else:
			gfx.toggle_flipped(true)

func set_held_by(hands, unique_id):
	holding_parent = hands;
	holding_unique_id = unique_id;

func drop():
	holding_parent = null;
	holding_unique_id = -1;
	gfx.toggle_hands(false);
	print("weapon drop heard")

func _process(delta):
	trigger_held(trigger_input);

func _physics_process(delta):
	rigidbody.freeze = (holding_parent != null)

	

	if(!rigidbody.freeze): return
	rigidbody.move_and_collide(rigidbody.position - holding_parent.global_position);
	global_position = holding_parent.global_position;

func trigger_held(held):
	
	push_warning("trigger held behaviour undefined, override in child class! Using default shoot function...")
	shoot();

func shoot():
	push_warning("shoot behaviour undefined, override in child class!")
	# projectile_shoot();

func modulate_aim(aim_vec, degrees_variance) -> Vector2:
	var aim_vec_angle = atan2(aim_vec.y, aim_vec.x);

	var angle_variance = randf_range(-degrees_variance/2, degrees_variance/2);
	var new_angle = aim_vec_angle + angle_variance;
	var resultant : Vector2 = Vector2(cos(new_angle), sin(new_angle)); 

	return resultant;


# func projectile_shoot():
# 	var shot = projectile.instantiate();

# 	shot.init( #setup projectile
# 	shoot_point.global_position, #start pos
# 	aim_vec.normalized(), #Direction
# 	projectile_speed, #speed
# 	projectile_damage, #damage
# 	projectile_lifetime, #lifetime (seconds)
# 	holding_team #team integer
# 	)
# 	#add projectile to parent in scene 
# 	Singletons.projectiles.projectile_parent.add_child(shot) 
