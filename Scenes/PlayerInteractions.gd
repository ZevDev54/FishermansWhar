extends Area2D

var player : Player;
var controls : PlayerControls;

# Called when the node enters the scene tree for the first time.
func _ready():
	player = (owner as Player)
	controls = player.controls;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(controls.input.is_action_just_pressed("interact")):
		try_interact();

func try_interact():
	var interaction_areas = get_overlapping_areas();

	for area in interaction_areas:
		if(area.owner is Interactable):
			var interactable = area.owner as Interactable;

			interactable.PlayerInteract(player);
