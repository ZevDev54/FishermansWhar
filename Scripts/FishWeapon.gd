extends Node2D
class_name FishWeapon

@export var rigidbody : RigidBody2D;
@export var gfx : WeaponGfx;
@export var shoot_point : Node2D;

var holding_parent;


func set_held_by(hands):
    holding_parent = hands;

func drop():
    holding_parent = null;
    gfx.toggle_hands(false);
    print("weapon drop heard")

func _process(delta):
    rigidbody.freeze = (holding_parent != null)

    if(!holding_parent): return
    rigidbody.move_and_collide(rigidbody.position - holding_parent.global_position);
    global_position = holding_parent.global_position;

func shoot():
    pass; 