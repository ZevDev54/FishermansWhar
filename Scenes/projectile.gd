extends ContactDamager

var object = self;
var rigidbody = self;
var shoot_direction = Vector2.ZERO;
var speed = 0.0;
var lifetime = 1.0;

func init(set_position, set_direction, set_speed, set_damage, set_lifetime, set_team):
	rigidbody.position = set_position;
	# move_and_collide(global_position);
	self.team_int = set_team;
	self.shoot_direction = set_direction;
	self.speed = set_speed;
	self.damage = set_damage;
	self.lifetime = set_lifetime;
	# print("Initialize!!")


func _process(delta):
	if(lifetime > 0):
		lifetime -= delta;
	else:
		queue_free()
	pass

func _physics_process(delta):
	object.global_position += shoot_direction * speed * delta;
	rigidbody.move_and_collide(rigidbody.position - object.global_position);
	# print(global_position)

func deal_damage(damageable):
	super.deal_damage(damageable);
	queue_free();



	# if(collision is Damageable):
	# 	print("Hit something!")
	# 	(collision as Damageable).take_damage(damage);

func _on_body_entered(body:Node):
	queue_free();


# func _on_hit_box_area_entered(area):
# 	if(area is Damageable):
# 		(area as Damageable).take_damage(damage, team_int);
