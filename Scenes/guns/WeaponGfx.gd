class_name WeaponGfx;
extends Node2D

@export var gfx_root : Node2D;
@export var hands_sprite : Sprite2D;
@export var nohands_sprite : Sprite2D;



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func toggle_hands(toggle):
	hands_sprite.visible = toggle;
	nohands_sprite.visible = !toggle;

func toggle_flipped(toggle):
	gfx_root.scale.y =  (-1 if toggle else 1);
