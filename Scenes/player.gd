extends Node
class_name Player;

var player_id = -1;

@export var movement : FishermanMovement;
@export var controls : PlayerControls;

var player_index;

signal leave;

func init(player_num: int, device: int):
	player_index = player_num
	
	controls.input = DeviceInput.new(device)
	controls.player_index = player_num;
	
	player_id = randi_range(0, 1000000); # later, change to ensure no duplicate ID edge cases.
	
	# $Player.text = "%s" % player_num
