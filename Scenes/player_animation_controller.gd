extends Node2D
class_name PlayerAnimationController;

@onready var animtree = $AnimationTree;
@export var hands : Node2D;
var state_machine;

# Called when the node enters the scene tree for the first time.
func _ready():
	state_machine = animtree.get("parameters/playback")



func set_running(running):
	if running:
		state_machine.travel("player_run");
		# print("set running!")
	else:
		state_machine.travel("player_idle")
		# print("set idle!")

func set_hands_active(active):
	hands.visible = active;
