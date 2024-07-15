extends DamageSource
class_name ExplosionDamager

@export var damage_area : Area2D;

@export var particles : GPUParticles2D

@export var damage_pulse_rate = 0.2;
var damage_pulse_timer := 0.0;

@export var active_time = 1.0;

func _ready():
	pass


func _process(delta):
	if damage_pulse_timer >= 0:
		damage_pulse_timer -= delta;
	else:
		damage_pulse_timer = damage_pulse_rate;
		damage_overlapping();
	
	if active_time >= 0:
		active_time -= delta;
	else:
		queue_free();




func damage_overlapping():
	particles.emitting = true;
	var contacts = damage_area.get_overlapping_areas();
	# print(str(contacts))

	for contact in contacts:
		var hurt = contact as HurtBox
		if hurt:
			deal_damage(hurt.damageable)
			print("dealt damage to: "+str(hurt))

func deal_damage(damageable : Damageable) -> bool:
	var result : HitEvent = damageable.take_damage(damage, unique_id_source)


	
	if(result.damage == 0): return false;

	return true;

