extends Node
class_name PlayerControls;

var input;
var player_index;

@export var movement_deadzone = 0.5;
@export var aiming_deadzone = 0.2;

func get_move_vec() -> Vector2:
	var x = input.get_axis("move_left", "move_right")
	var y = input.get_axis("move_up", "move_down")
	var move_vec = Vector2(x,y);

	if(move_vec.length() > 1):
		move_vec = move_vec.normalized();

	if(move_vec.length() > movement_deadzone):
		return move_vec.normalized();
	return Vector2.ZERO;

func get_aim_vec() -> Vector2:
	var x = input.get_axis("aim_left", "aim_right")
	var y = input.get_axis("aim_up", "aim_down")
	var aim_vec = Vector2(x,y);

	if(aim_vec.length() > 1):
		aim_vec = aim_vec.normalized();

	if(aim_vec.length() > aiming_deadzone):
		return aim_vec.normalized();
	return Vector2.ZERO;
