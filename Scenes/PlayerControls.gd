extends Node
class_name PlayerControls;

var input;
var player_index;

func get_move_input_vec() -> Vector2:
	var x = input.get_axis("move_left", "move_right")
	var y = input.get_axis("move_up", "move_down")
	return Vector2(x,y).normalized();

func rumble(time: float, intensity: float):
	Input.start_joy_vibration(input.device, intensity, intensity, time);


# func light_rumble(time: float, intensity: float):
# 	# print("Start rumble")
# 	Input.start_joy_vibration(input.device, intensity, intensity, time);
# 	# rumble_timer(time);
# 	# print("End Rumble")

# func heavy_rumble(time: float, intensity: float):
# 	Input.start_joy_vibration(input.device, intensity, intensity, time);
	
# func rumble_timer(time: float):
# 	await get_tree().create_timer(time).timeout
# 	# input.device

