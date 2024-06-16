class_name Damageable;

var health;
var max_health : int = 100;

func _ready():
    health = max_health;

func take_damage(damage):
    health -= damage;
    if(health <= 0):
        die();
    
func die():
    print("I die!")