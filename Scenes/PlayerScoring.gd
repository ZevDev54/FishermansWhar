extends Node
class_name PlayerScoring;


var score : int = 0;
@export var score_display : Label;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func count_kill(unique_id):
	score += 1;
	print("Player", str(unique_id), "Scored a kill!")
	score_display.text = (str(score));

func count_last_standing():
	score += 1;
