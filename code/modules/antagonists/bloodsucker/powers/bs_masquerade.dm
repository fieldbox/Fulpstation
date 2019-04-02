


// 		WITHOUT THIS POWER:
//
//	- Mid-Blood: SHOW AS PALE
//	- Low-Blood: SHOW AS DEAD
//	- No Heartbeat
//  - Examine shows actual blood
//	- Thermal homeostasis (ColdBlooded)



// 		WITH THIS POWER:
//	- Normal body temp -- remove Cold Blooded (return on deactivate)
//	-






/datum/action/bloodsucker/masquerade
	name = "Masquerade"//"Cellular Emporium"
	desc = "Feign the vital signs of a mortal, and escape both casual and medical notice as the monster you truly are."
	icon_icon = 'icons/obj/drinks.dmi'
	button_icon_state = "changelingsting"
	background_icon_state = "bg_changeling"

	bloodcost = 0
	cooldown = 30
	amToggle = TRUE



// NOTE: Firing off vulgar powers disables your Masquerade!


/datum/action/bloodsucker/masquerade/CheckCanUse(display_error)
	if(!..(display_error))// DEFAULT CHECKS
		return FALSE
	// Must be ALIVE. Must be AWAKE.
	// Cannot have other powers on!



/datum/action/bloodsucker/masquerade/ActivatePower()

	var/mob/living/user = owner
	var/datum/antagonist/bloodsucker/bloodsuckerdatum = user.mind.has_antag_datum(ANTAG_DATUM_BLOODSUCKER)

	to_chat(user, "<span class='notice'>Your heart beats falsely within your lifeless chest. You may yet pass for a mortal.</span>")
	to_chat(user, "<span class='warning'>Your vampiric healing is halted while imitating life.</span>")

	bloodsuckerdatum.poweron_masquerade = TRUE



	// WE ARE ALIVE! //
	while(ContinueActive(user))

		// 		ACTIONS:
		// start heart (if it's not aleady)
		//
		// 		PASSIVE (done from LIFE)
		// Raise Temperature
		// Don't Show Pale/Dead on low blood
		// Don't vomit food


		sleep(20) // Check every few ticks that we haven't disabled this power



	DeactivatePower()





/datum/action/bloodsucker/masquerade/ContinueActive(mob/living/user)
	return ..() // Active, and still Antag


/datum/action/bloodsucker/masquerade/DeactivatePower(mob/living/user = owner, mob/living/target)
	..() // activate = FALSE

	var/datum/antagonist/bloodsucker/bloodsuckerdatum = user.mind.has_antag_datum(ANTAG_DATUM_BLOODSUCKER)
	bloodsuckerdatum.poweron_masquerade = FALSE

	// 		ACTIONS:
	// -stop heart

	to_chat(user, "<span class='notice'>Your heart beats one final time, while your skin dries and your icy pallor returns.</span>")

