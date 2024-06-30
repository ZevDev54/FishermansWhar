extends DamageSource

var object = self;
var rigidbody = self;
var shoot_direction = Vector2.ZERO;
var speed = 0.0;
var lifetime = 1.0;

func init(set_position, set_direction, set_speed, set_damage, set_lifetime, set_unique_id):
	rigidbody.position = set_position;
	# move_and_collide(global_position);
	unique_id_source = set_unique_id;
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

func deal_damage(damageable : Damageable) -> bool:

	var result : HitEvent = damageable.take_damage(damage, unique_id_source)



	
	if(result.damage): return false;


	hit_behavior();
	return true;



	# if(collision is Damageable):
	# 	print("Hit something!")
	# 	(collision as Damageable).take_damage(damage);

func hit_behavior():
	queue_free();


# func _on_hit_box_area_entered(area):
# 	if(area is Damageable):
# 		(area as Damageable).take_damage(damage, team_int);


# func _on_area_2d_area_entered(area:Area2D):
# 	var hit_damageable = (area as Damageable) # area as HitBox
# 	if(hit_damageable):
# 		deal_damage(hit_damageable)
