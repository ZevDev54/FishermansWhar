class_name HitEvent

var damage : int;
var lethal : bool;
var damage_source_id;

static func create_hit(dmg, lethal, player_id) -> HitEvent:
    var new_hit = HitEvent.new();
    new_hit.damage = dmg;
    new_hit.lethal = lethal
    new_hit.damage_source_id = player_id;
    return new_hit;
