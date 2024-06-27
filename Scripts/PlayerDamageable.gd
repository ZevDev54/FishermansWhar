extends Damageable

var player : Player;
@export var player_body : Node2D;
@export var hurt_animation : AnimationPlayer;
@export var weapon : PlayerWeapon;

func _ready():
	player = owner as Player;

func take_damage(damage, unique_player_id):
	if(unique_player_id != player.unique_player_id):
		health -= damage;
		var lethal = (health <= 0) # killed player?

		hurt_animation.play("player_hurt");
		Singletons.Scoring.credit_player_damage(unique_player_id, damage, lethal)

		if lethal:
			die();

func die():
	# make better system in the future!
	player_body.position = Vector2(randf_range(0, 500), 
	randf_range(0, 500));
	health = max_health;
	weapon.drop_weapon();
