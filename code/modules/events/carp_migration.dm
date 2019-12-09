/datum/event/carp_migration
	announceWhen	= 50
	endWhen 		= 600


/datum/event/carp_migration/setup()
	announceWhen = rand(5, 25)
	endWhen = rand(350, 700)

/datum/event/carp_migration/announce()
	var/announcement = ""
	if(severity == EVENT_LEVEL_MAJOR)
		announcement = "Massive migration of unknown biological entities has been detected in the sky near [station_name()], please stand-by."
	else
		announcement = "Unknown biological entities have been detected in the sky near [station_name()], please stand-by."
	command_announcement.Announce(announcement, "Lifesign Alert")

/datum/event/carp_migration/start()
	spawn(25)
		for(var/datum/planet/planet in SSplanets.planets)
			switch(severity)
				if(EVENT_LEVEL_MAJOR)
					planet.weather_holder.change_weather(WEATHER_CARPNADO)
				else
					planet.weather_holder.change_weather(WEATHER_CARPFALL)

/datum/event/carp_migration/end()
	for(var/datum/planet/planet in SSplanets.planets)
		planet.weather_holder.change_weather(WEATHER_CLEAR)