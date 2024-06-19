extends FishWeapon

@export var shoot_rate := 0.50;
@export var animation : AnimationPlayer;
var shoot_timer = 0.0;

var trigger_was_held;

@export var shells_per_shot = 8;
@export var degrees_variance = 15.0;
@export var min_speed = 500;

# Called when the node enters the scene tree for the first time.
func _ready():
	# print("is fishweapon? ",str(self is FishWeapon))	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)

	if(shoot_timer > 0):
		shoot_timer -= delta;


	

func trigger_held(held):
	
	if (held && !trigger_was_held && shoot_timer <= 0):
		shoot();
		shoot_timer = shoot_rate;

	trigger_was_held = held;

func shoot():
	var aim_vec_angle = atan2(aim_vec.y, aim_vec.x);

	for i in range(shells_per_shot):
		var angle_variance = randf_range(-degrees_variance/2, degrees_variance/2);
		var new_angle = aim_vec_angle + angle_variance;
		var resultant = Vector2(cos(new_angle), sin(new_angle)); 

		projectile_shoot(resultant, randf_range(min_speed, projectile_speed));


	animation.stop(true);
	animation.play("shoot");
	



func projectile_shoot(aim_vec_override, speed):
	var shot = projectile.instantiate();

	shot.init( #setup projectile
	shoot_point.global_position, #start pos
	aim_vec_override, #Direction
	speed, #speed
	projectile_damage, #damage
	projectile_lifetime, #lifetime (seconds)
	holding_team #team integer
	)
	#add projectile to parent in scene 
	Singletons.projectiles.projectile_parent.add_child(shot) 
