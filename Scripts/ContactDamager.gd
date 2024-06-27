extends DamageSource;
class_name ContactDamager

func deal_damage(damageable) -> bool: # bool for was successful?
    
    var damaged = damageable.take_damage(self.damage, self.unique_id_source); #vars from parent
    if !damaged: return false;
    print("Damage to:", str(damageable));
    return true;
