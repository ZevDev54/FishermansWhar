extends FishWeapon

@export var shoot_rate := 0.50;
@export var animation : AnimationPlayer;

@export var degrees_inaccuracy : float = 0.5;

var shoot_timer = 0.0;

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


	if(shoot_timer <= 0 && held):
		shoot();
		shoot_timer = shoot_rate;

func shoot():
	projectile_shoot();
	animation.stop(true);
	animation.play("shoot");
	gun_rumble();


func projectile_shoot():
	var shot = projectile.instantiate();

	var dir = modulate_aim(aim_vec.normalized(), degrees_inaccuracy)

	shot.init( #setup projectile
	shoot_point.global_position, #start pos
	dir, #Direction
	projectile_speed, #speed
	projectile_damage, #damage
	projectile_lifetime, #lifetime (seconds)
	holding_unique_id #team integer
	)
	#add projectile to parent in scene 
	Singletons.Projectiles.add_projectile_child(shot) 
