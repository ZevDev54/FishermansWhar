extends Damageable

@export var player_body : Node2D;
@export var hurt_animation : AnimationPlayer;
@export var weapon : PlayerWeapon;

func take_damage(damage, team_int):
	super.take_damage(damage, team_int);
	hurt_animation.play("player_hurt");

func die():
	# make better system in the future!
	player_body.position = Vector2(randf_range(0, 500), 
	randf_range(0, 500));
	health = max_health;
	weapon.drop_weapon();
