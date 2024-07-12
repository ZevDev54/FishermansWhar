extends Node2D
class_name PlayerAnimationController;



@onready var animtree = $AnimationTree;
@export var hands : Node2D;
@export var player_colorable_sprite : Sprite2D;
var state_machine;

var dead;
var anticipating_dash : bool;

# Called when the node enters the scene tree for the first time.
func _ready():
	state_machine = animtree.get("parameters/playback")
	


func color_player(id):
	player_colorable_sprite.modulate = Singletons.Players.get_color_of_id(id);

func set_running(running):
	if dead: return;
	if anticipating_dash:  return;

	if running:
		state_machine.travel("player_run");
		# print("set running!")
	else:
		state_machine.travel("player_idle")
		# print("set idle!")

func set_hands_active(active):
	hands.visible = active;

func set_dead(toggle):
	dead = toggle;
	if(dead):
		state_machine.travel("player_dead");

func dash():
	state_machine.travel("player_dash");

func set_anticipating_dash(toggle : bool):
	anticipating_dash = toggle;

	if(anticipating_dash):
		state_machine.travel("player_dash_anticipate");