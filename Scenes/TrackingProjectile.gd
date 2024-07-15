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

	var explosion = hit_fx_instance as ExplosionDamager;
	if(explosion):
		explosion.unique_id_source = unique_id_source
	else:
		print("You done goof, hitfx is not explosion!")
	queue_free();

func _on_area_2d_area_entered(area:Area2D):
	var hurtbox = (area as HurtBox) # area as HitBox

	if(hurtbox):
		hit_behavior();
	