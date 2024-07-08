extends Node2D
class_name ProjectileColorer;

@export var default_color : Color;
@export var outline : Sprite2D;
@export var fill : Sprite2D;

func set_team_color(color : Color):
	outline.material.set_shader_parameter("color1", default_color);
	fill.material.set_shader_parameter("color1", default_color);

	outline.material.set_shader_parameter("color2", color);
	fill.material.set_shader_parameter("color2", color);
