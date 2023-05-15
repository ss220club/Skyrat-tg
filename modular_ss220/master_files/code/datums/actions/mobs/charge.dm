/datum/action/cooldown/mob_cooldown/charge/triple_charge
	charge_delay = 0.9 SECONDS //Original: 0.6

/datum/action/cooldown/mob_cooldown/charge/triple_charge/charge_sequence(atom/movable/charger, atom/target_atom, delay, past) // Overriden
	for(var/i in 0 to 2)
		do_charge(owner, target_atom, charge_delay - 3 * i, charge_past)

/datum/action/cooldown/mob_cooldown/charge/hallucination_charge
	charge_delay = 0.9 SECONDS //Original: 0.6

/datum/action/cooldown/mob_cooldown/charge/hallucination_charge/hallucination_surround
	charge_delay = 0.9 SECONDS //Original: 0.6
