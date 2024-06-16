extends Node2D
class_name FishWeapon

@export var rigidbody : RigidBody2D;
@export var gfx : WeaponGfx;
@export var shoot_point : Node2D;
@export var projectile : PackedScene;
@export var projectile_speed = 200;
@export var projectile_damage = 20;
@export var projectile_lifetime = 2;

var holding_parent;
var holding_team;
var aim_vec;

func aim_loop(set_aim_x, set_aim_y):
    aim_vec = Vector2(set_aim_x, set_aim_y);

    if (aim_vec):
        #Rotate weapon
        var aim_rotation = atan2(aim_vec.y, aim_vec.x)
        global_rotation = aim_rotation;

        #degrees = lerp(degrees, atan2(aim_vec.x, aim_vec.y), rotateSpeed * delta)
        #weapon.global_rotation = degrees - 90;

        # set weapon flipped or not
        var aim_rotation_degrees = rad_to_deg(aim_rotation) + 180
        # print(aim_rotation_degrees)
        if (aim_rotation_degrees > 90&&aim_rotation_degrees < 270):
            gfx.toggle_flipped(false)
        else:
            gfx.toggle_flipped(true)

func set_held_by(hands, team):
    holding_parent = hands;
    holding_team = team;

func drop():
    holding_parent = null;
    holding_team = -1;
    gfx.toggle_hands(false);
    print("weapon drop heard")

func _process(delta):
    rigidbody.freeze = (holding_parent != null)

    if(!holding_parent): return
    rigidbody.move_and_collide(rigidbody.position - holding_parent.global_position);
    global_position = holding_parent.global_position;

func shoot():
    var shot = projectile.instantiate();

    shot.init( #setup projectile
    shoot_point.global_position, #start pos
    aim_vec.normalized(), #Direction
    projectile_speed, #speed
    projectile_damage, #damage
    projectile_lifetime, #lifetime (seconds)
    holding_team #team integer
    )
    #add projectile to parent in scene 
    Singletons.projectiles.projectile_parent.add_child(shot) 