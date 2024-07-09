extends Node
class_name GameManager;


# Called when the node enters the scene tree for the first time.
func _ready():
	if Singletons.Game == null:
		Singletons.Game = self;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
