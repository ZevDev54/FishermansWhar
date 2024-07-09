extends Node2D
class_name GunManager

@export var gun_parent : Node2D;

func _ready():
	if(!Singletons.Guns):
		Singletons.Guns = self;
		print("Set projectiles parent")

func add_gun_child(node : Node2D):
	gun_parent.add_child(node);
