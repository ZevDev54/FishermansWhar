extends Node2D
class_name ProjectileManager

@export var projectile_parent : Node2D;

func _ready():
	if(!Singletons.Projectiles):
		Singletons.Projectiles = self;
		print("Set projectiles parent")
