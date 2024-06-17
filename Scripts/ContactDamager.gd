extends DamageSource;
class_name ContactDamager

func deal_damage(damageable):
    damageable.take_damage(self.damage, self.team_int); #vars from parent
    print("Damage to:", str(damageable));
