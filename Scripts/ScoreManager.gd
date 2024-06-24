extends Node
class_name ScoreManager;

func _ready():
	print("ahhh score amanger andanda")
	if Singletons.Scoring == null:
		Singletons.Scoring = self;

func credit_player_damage(unique_id : int, damage : int, lethal : bool):
	var player_scoring = Singletons.Players.get_player_from_id(unique_id).scoring;
	if lethal: 
		player_scoring.count_kill(unique_id);
