extends Node;
class_name Damageable;

var health;
@export var max_health: int = 100;

func _ready():
	health = max_health;

func take_damage(damage, team):
	health -= damage;
	print("Take damage!")
	if (health <= 0):
		die();
	
func die():
	# print("I die!")
	queue_free();

func _on_hurt_box_body_entered(body):
	if (body is ContactDamager):
		(body as ContactDamager).deal_damage(self);
		print("COntacted");
