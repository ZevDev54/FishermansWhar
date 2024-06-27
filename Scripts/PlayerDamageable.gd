extends Damageable

@export var player : Player;
@export var hurt_animation : AnimationPlayer;
@export var weapon : PlayerWeapon;

func ready():
	super.ready();
	print("rafy!");
	player = (owner as Player);

func take_damage(damage, unique_player_id) -> bool:
	if(unique_player_id == player.unique_player_id): return false;
	

	health -= damage;
	var lethal = (health <= 0) # killed player?
	

	Singletons.Scoring.credit_player_damage(unique_player_id, damage, lethal);

	hurt_animation.play("player_hurt");

	

	if lethal:
		die();
	return true;

	

func die():
	# make better system in the future!
	player.movement.move_to_position(Vector2(500, 400));
	health = max_health;
	weapon.drop_weapon();
