extends Node

@export var lerp_speed : float = 30.0;
@export var body : Node2D;
@export var graphics : Node2D;


func _process(delta):
	graphics.global_position = graphics.global_position.lerp(body.global_position, lerp_speed * delta)
