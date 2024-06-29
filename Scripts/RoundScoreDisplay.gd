extends Node;
class_name RoundScoreDisplay;


@export var scores_intro_animation : AnimationPlayer;

@export var label_list : Array[Label]
@export var round_num : Label;



func _ready():
    scores_intro_animation.play("RESET");

func toggle_round_screen(toggle):
    
    if toggle: 
        scores_intro_animation.play("round_over_intro");
    else: 
        scores_intro_animation.play("round_over_outro")

func toggle_player_labels(players : Array[Player]):
    for lid in range(label_list.size()):
        label_list[lid].visible = (lid < players.size());


func show_scores(players : Array[Player], round):
    toggle_player_labels(players);
    toggle_round_screen(true);

    for pid in range(players.size()):
        label_list[pid].text = "P"+str(pid+1)+" Score: "+str(players[pid].scoring.score);
    round_num.text = str(round);


    