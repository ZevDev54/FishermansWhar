extends Node;
class_name Damageable;

var health : int;
@export var max_health: int = 100;

func _ready():
	health = max_health;

func take_damage(damage, unique_player_id):
	health -= damage;

	var lethal = (health <= 0) # killed player?

	Singletons.Scoring.credit_player_damage(unique_player_id, damage, lethal)
	
	if lethal:
		die();
	
func die():
	# print("I die!")
	queue_free();

func _on_hurt_box_body_entered(body):
	if (body is ContactDamager):
		(body as ContactDamager).deal_damage(self);
		print("COntacted");
