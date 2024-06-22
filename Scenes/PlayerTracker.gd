extends Node
class_name PlayerTracker;

var player_list : Array[Player] = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	if Singletons.Players == null:
		Singletons.Players = self;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
