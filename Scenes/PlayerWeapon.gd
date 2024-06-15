extends Node2D

@onready var weapon = $ActualWeapon
@onready var weapon_gfx : Node2D = $ActualWeapon/GFX
@export var rotateSpeed = 5;

var degrees : float = 0;

var input;


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var aim_x = input.get_axis("aim_left", "aim_right")
	var aim_y = input.get_axis("aim_up", "aim_down")
	
	var aim_vec = Vector2(aim_x, aim_y);

	if(aim_vec):
		var aim_rotation = atan2(aim_vec.y, aim_vec.x)
		weapon.global_rotation = aim_rotation;

		var aim_rotation_degrees = rad_to_deg(aim_rotation) + 180
		print(aim_rotation_degrees)
		if(aim_rotation_degrees > 90 && aim_rotation_degrees < 270):
			weapon_gfx.scale.y = 1;
		else: 
			weapon_gfx.scale.y = -1;


		# degrees = lerp(degrees, atan2(aim_vec.x, aim_vec.y), rotateSpeed * delta)
		# weapon.global_rotation = degrees - 90;
