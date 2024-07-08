extends Node
class_name PlayerTracker;

var player_list : Array[Player] = [];

@export var player_cols : Array[Color];

# Called when the node enters the scene tree for the first time.
func _ready():
	if Singletons.Players == null:
		Singletons.Players = self;


func register_player(player : Player):
	player_list.append(player);

func unregister_player(player : Player):
	for p in range(player_list.size()):
		if player_list[p] == player:
			player_list.remove_at(p); # could lead to dangerous undefined behaviour if there is something else trying to access the player.

func get_player_from_id(unique_id):
	for player in player_list:
		if(player.unique_player_id == unique_id):
			return player;

func get_index_from_id(id):
	for i in range(player_list.size()):
		if player_list[i].unique_player_id == id:
			return i;

func get_color_of_id(id):
	var index = get_index_from_id(id);
	return player_cols[index];
