extends FishWeapon

@export var shoot_rate := 0.50;
@export var animation : AnimationPlayer;
var shoot_timer = 0.0;

var trigger_was_held;

@export var shells_per_shot : int = 8;
@export var degrees_variance = 15.0;
@export var min_speed = 500;

# Called when the node enters the scene tree for the first time.
func _ready():
	# print("is fishweapon? ",str(self is FishWeapon))	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta);
	if(shoot_timer > 0):
		shoot_timer -= delta;


	

func trigger_held(held):
	if(!holding_parent): return;
	if (held && !trigger_was_held && shoot_timer <= 0):
		shoot();
		shoot_timer = shoot_rate;

	trigger_was_held = held;

func shoot():

	for i in range(shells_per_shot):
		var dir : Vector2 = modulate_aim(Vector2(aim_vec.x, aim_vec.y), degrees_variance);
		projectile_shoot(dir, randf_range(min_speed, projectile_speed));


	animation.stop(true);
	animation.play("shoot");
	gun_rumble();

	



func projectile_shoot(aim_vec_override, speed):
	var shot = projectile.instantiate();

	shot.init( #setup projectile
	shoot_point.global_position, #start pos
	aim_vec_override, #Direction
	speed, #speed
	projectile_damage, #damage
	projectile_lifetime, #lifetime (seconds)
	holding_unique_id #team integer
	)
	#add projectile to parent in scene 
	Singletons.Projectiles.add_projectile_child(shot)

