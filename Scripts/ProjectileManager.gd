extends Node2D
class_name ProjectileManager

@export var projectile_parent : Node2D;

func _ready():
	if(!Singletons.projectiles):
		Singletons.projectiles =  self;
