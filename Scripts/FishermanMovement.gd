extends CharacterBody2D

signal leave

@export var player_index = 0;
var input_velocity = Vector2.ZERO;
@export var speed = 200;

var input;

func init(player_num: int, device: int):
	player_index = player_num
	
	# in my project, I got the device integer by accessing the singleton autoload PlayerManager
	# but for simplicity, it's not an autoload in this demo.
	# but I recommend making it a singleton so you can access the player data from anywhere.
	# that would look like the following line, instead of the device function parameter above.
	# var device = PlayerManager.get_player_device(player)
	input = DeviceInput.new(device)
	
	# $Player.text = "%s" % player_num

func _physics_process(delta):
	var move = input.get_vector("move_left", "move_right", "move_up", "move_down")


	global_position += move * speed * delta;

	move_and_slide();
	
