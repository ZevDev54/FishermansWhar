extends Node;
class_name Damageable;

var health : int;
@export var max_health: int = 100;





func _ready():
	health = max_health;




func take_damage(damage, unique_player_id) -> HitEvent:
	health -= damage;
	var lethal = (health <= 0) # killed player?
	if lethal:
		die();
	# return true; # bool for did do damage?
	return HitEvent.create_hit(damage, lethal, unique_player_id);

	
func die():
	# print("I die!")
	queue_free();

# func _on_hurt_box_body_entered(body):
# 	if (body is ContactDamager):
# 		(body as ContactDamager).deal_damage(self);
# 		print("COntacted");
