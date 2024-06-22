extends CharacterBody2D
class_name FishermanMovement;




var input_velocity = Vector2.ZERO;
@export var speed = 200;

var input;

@onready var weapon = $Weapon;

func _ready():
	input = (owner as Player).controls.input;


func _physics_process(delta):
	var x = input.get_axis("move_left", "move_right")
	var y = input.get_axis("move_up", "move_down")



	global_position += Vector2(x,y) * speed * delta;

	move_and_slide();
	
