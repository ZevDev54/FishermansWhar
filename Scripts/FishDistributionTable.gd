extends Resource
class_name FishDistribution

@export var fish_listings : Array[FishAndRarity] = []





# https://stackoverflow.com/questions/1761626/weighted-random-numbers
func get_fish_pull() -> PackedScene:
	var sum_of_weight = 0.0;
	for item : FishAndRarity in fish_listings:
		sum_of_weight += item.random_weight;
	
	var rand = randf_range(0, sum_of_weight);

	for i in range(fish_listings.size()):
		if(rand < fish_listings[i].random_weight):
			return fish_listings[i].fish_scene;
		rand -= fish_listings[i].random_weight
	
	assert("error in getting weighted random!")
	return fish_listings[0].fish_scene
	
