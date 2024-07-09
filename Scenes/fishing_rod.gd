extends Interactable

@export var catch_fish : PackedScene;
@export var fish_spawn_point : Node2D;

func PlayerInteract(player : Player):
	var fish_gun : FishWeapon = catch_fish.instantiate();
	fish_gun.set_pos_immediate(fish_spawn_point.global_position)
	Singletons.Guns.add_gun_child(fish_gun);