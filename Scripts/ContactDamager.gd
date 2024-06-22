extends DamageSource;
class_name ContactDamager

func deal_damage(damageable):
    damageable.take_damage(self.damage, self.unique_id_source); #vars from parent
    print("Damage to:", str(damageable));
