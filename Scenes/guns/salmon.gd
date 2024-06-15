extends FishWeapon



# Called when the node enters the scene tree for the first time.
func _ready():
	print("is fishweapon? ",str(self is FishWeapon))	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)


func shoot():
	super.shoot();
	pass


