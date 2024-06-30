extends Node
class_name PlayerControls;

var input;
var player_index;

func get_move_input_vec() -> Vector2:
	var x = input.get_axis("move_left", "move_right")
	var y = input.get_axis("move_up", "move_down")
	return Vector2(x,y).normalized();