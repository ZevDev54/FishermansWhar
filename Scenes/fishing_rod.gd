extends Interactable

@export var catch_fish : PackedScene;
@export var fish_spawn_point : Node2D;

@export var fish_table : FishDistribution;

@export var min_fish_bite_time := 5.0;
@export var max_fish_bite_time := 10.0;

var bite_timer := 0.0;

@onready var animtree = $AnimationTree;
var anim_state_machine

var fish_on_hook : bool = false;

func _ready():
	anim_state_machine = animtree.get("parameters/playback")

func _process(delta):
	if fish_on_hook: return;

	if bite_timer > 0:
		bite_timer -= delta;
	else:
		bite_timer = randf_range(min_fish_bite_time, max_fish_bite_time);
		FishBite();

func FishBite():
	anim_state_machine.travel("fish_on_hook");
	fish_on_hook = true;
	print("Amongstus")




func PlayerInteract(player : Player):
	if !fish_on_hook: return;

	var rand_fish = fish_table.get_fish_pull();

	var fish_gun : FishWeapon = rand_fish.instantiate();
	fish_gun.set_pos_immediate(fish_spawn_point.global_position)
	Singletons.Guns.add_gun_child(fish_gun);

	fish_on_hook = false;

	anim_state_machine.travel("fish_caught");
