extends Node
class_name RoundManager;

var round_num := 0;

@export var round_score_display : RoundScoreDisplay;


func _ready():
	if(Singletons.Rounds == null):
		Singletons.Rounds = self;


func player_dead_event():
	var alive = count_players_alive();
	
	if alive == 1: #replace with mroe sophisticated system to handle teams, eventually.
		end_round();


func count_players_alive():
	var alive_count : int = 0;
	for player : Player in Singletons.Players.player_list:
		if player.damageable.alive:
			alive_count += 1;
	
	return alive_count;

func end_round():
	
	# for player : Player in Singletons.Players.player_list:
	# 	print(str(player.unique_player_id), player.scoring.score);
	round_num += 1;
	round_score_display.show_scores(Singletons.Players.player_list,round_num);