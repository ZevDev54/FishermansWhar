extends RigidBody2D


var shoot_direction = Vector2.ZERO;
var speed = 0;
var damage = 0;
var shot_by_index = 0;
var lifetime = 0;

func init(set_position, set_direction, set_speed, set_damage, set_lifetime, set_team):
	global_position = set_position;
	# move_and_collide(global_position);
	self.shot_by_index = set_team;
	self.shoot_direction = set_direction;
	self.speed = set_speed;
	self.damage = set_damage;
	self.lifetime = set_lifetime;
	# print("Initialize!!")


func _physics_process(delta):
	global_position += shoot_direction * speed * delta;
	var collision = move_and_collide(self.position - global_position);
	# print(global_position)



	if(collision is Damageable):
		print("Hit something!")
		(collision as Damageable).take_damage(damage);

# func _on_body_entered(body:Node):
# 	pass # Replace with function body.
