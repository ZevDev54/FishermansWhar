extends Node
class_name Player;

var unique_player_id = -1;

@export var movement : FishermanMovement;
@export var controls : PlayerControls;
@export var scoring : PlayerScoring;
@export var animation : PlayerAnimationController;

var player_index;

signal leave;

func init(player_num: int, device: int):
	player_index = player_num
	
	controls.input = DeviceInput.new(device)
	controls.player_index = player_num;
	
	unique_player_id = randi_range(0, 1000000); # later, change to ensure no duplicate ID edge cases.
	
	# $Player.text = "%s" % player_num


func remove_player():
	Singletons.Players.remove_player(self);
	queue_free();