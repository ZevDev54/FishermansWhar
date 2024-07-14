extends Projectile

var heading;


func _physics_process(delta):
	object.global_position += shoot_direction * speed * delta;
	rigidbody.move_and_collide(rigidbody.position - object.global_position);
	gfx.look_at(rigidbody.position + self.shoot_direction * 50)

func hit_behavior():
	var hit_fx_instance = hit_fx.instantiate()
	hit_fx_instance.global_position = rigidbody.position;
	Singletons.Projectiles.add_projectile_child(hit_fx_instance)
	queue_free();