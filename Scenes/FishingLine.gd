@tool
extends Line2D

@export var attach_point1 : Node2D;
@export var attach_point2 : Node2D;



func _process(delta):
	global_position = attach_point1.global_position;

	var point1 = Vector2(0,0);
	var point2 = attach_point2.global_position - global_position;

	points[0] = point1
	points[1] = point2

