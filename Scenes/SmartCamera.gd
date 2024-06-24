extends Node

@onready var actual_cam = $Camera

@export var distance_to_zoom_ratio = 200.0;
@export var min_zoom = 1.0;
@export var max_zoom = 2.0;
var zoom = 1.0;
@export var default_zoom := 1.0;

@export var cam_zoom_speed = 1.0;
@export var cam_pan_speed = 1.0;



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	actual_cam.global_position = actual_cam.global_position.lerp(get_target_point(), cam_zoom_speed * delta);
	# actual_cam.position = actual_cam.global_position.lerp(Vector2(300, 250), cam_zoom_speed * delta);

	zoom = lerp(zoom, get_target_zoom(), cam_zoom_speed * delta);
	# print(zoom_percent);

	
	actual_cam.zoom = Vector2(zoom * default_zoom, zoom * default_zoom);



func get_target_point():
	var players = Singletons.Players.player_list;

	var average_position = Vector2(0,0);

	for player in players:
		average_position += player.movement.global_position;

	average_position /= players.size();
	if(players.size() == 0) : average_position = Vector2(500, 500);

	return average_position;

func get_target_zoom():
	var players = Singletons.Players.player_list;

	var greatest_distance : float = -1;

	for px in players:
		for py in players:
			if px == py: continue; # Make sure player isnt being checked against itself.

			var difference : Vector2 = (px.movement.global_position - py.movement.global_position);

			var longest = difference.x if difference.x > difference.y else difference.y;

			if longest > greatest_distance:
				greatest_distance = longest;
	# print(greatest_distance)

	if(greatest_distance != -1):
		# return (-greatest_distance / distance_to_zoom_ratio) + max_zoom;
		var percent = greatest_distance/distance_to_zoom_ratio
		# print(percent)
		return distance_to_zoom_ratio/clamp(greatest_distance, min_zoom, max_zoom)
	else:
		return distance_to_zoom_ratio/min_zoom;
		# return 1.0;
