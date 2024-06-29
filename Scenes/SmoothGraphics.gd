extends Node

@export var lerp_speed : float = 30.0;
@export var body : Node2D;
@export var graphics : Node2D;
@export var max_move_amount := 20.0;

func _process(delta):
	if graphics.global_position.distance_to(body.global_position) > max_move_amount:
		graphics.global_position = body.global_position;
	graphics.global_position = graphics.global_position.lerp(body.global_position, lerp_speed * delta)
