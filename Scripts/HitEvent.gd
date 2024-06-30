class_name HitEvent

var damage : int;
var lethal : bool;
var damage_source_id;

static func create_hit(dmg, lethal, player_id):
    var instance = HitEvent.new();
    instance.damage = dmg;
    instance.lethal = lethal
    instance.damage_source_id = player_id;
