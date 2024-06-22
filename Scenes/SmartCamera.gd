extends Node

@onready var actual_cam = $Camera
@export var distance_to_zoom_ratio = 500.0;
@export var default_zoom = 1.0;
var zoom_percent = 1.0;

@export var cam_zoom_speed = 1.0;
@export var cam_pan_speed = 1.0;



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	actual_cam.position = actual_cam.global_position.lerp(get_target_point(), cam_zoom_speed * delta);
	zoom_percent = lerp(zoom_percent, get_target_zoom(), cam_zoom_speed * delta);

	actual_cam.zoom = zoom_percent * default_zoom



func get_target_point():
	var players = Singletons.Players.player_list;

	var average_position = Vector2(0,0);

	for player in players:
		average_position += player.movement.global_position;
	
	return average_position;

func get_target_zoom():
	var players = Singletons.Players.player_list;

	var greatest_diagonal = -1;

	for px in players:
		for py in players:
			if px == py: continue; # Make sure player isnt being checked against itself.

			var length : float = (px.movement.global_position - py.movement.global_position).magnitude;

			if length > greatest_diagonal:
				greatest_diagonal = length;

	if(greatest_diagonal != -1):
		return distance_to_zoom_ratio / greatest_diagonal
	else:
		return 1;
