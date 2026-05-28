extends Node

@export var destroy_target : Node
@export var destroy_time := 3.0;


func _process(delta):
	destroy_time -= delta;
	if destroy_time <= 0:
		if(destroy_target):
			destroy_target.queue_free()
		else:
			print("no destroy target, destroying self..")
			queue_free()