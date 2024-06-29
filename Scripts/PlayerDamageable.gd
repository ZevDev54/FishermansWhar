extends Damageable
class_name PlayerDamageable;

@export var player : Player;
@export var hurt_animation : AnimationPlayer;
@export var weapon : PlayerWeapon;

var alive = true;

func _ready():
	super._ready();
	# print("rafy!");
	player = (owner as Player);
	health = max_health

func take_damage(damage, unique_player_id) -> bool:
	if !alive: false;
	if(unique_player_id == player.unique_player_id): return false;
	

	health -= damage;
	var lethal = (health <= 0) # killed player?
	

	Singletons.Scoring.credit_player_damage(unique_player_id, damage, lethal);

	hurt_animation.play("player_hurt");

	

	if lethal:
		die();
	return true;

	

func die():
	if alive:
		alive = false;
		weapon.drop_weapon();
		player.animation.set_dead(!alive);
		Singletons.Rounds.player_dead_event();

	# make better system in the future!
	# player.movement.move_to_position(Vector2(500, 400));
	# health = max_health;
	
