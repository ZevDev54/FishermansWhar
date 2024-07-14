extends Node2D

@export var destroy_time := 3.0;


func _process(delta):
	destroy_time -= delta;
	if destroy_time <= 0:
		queue_free()