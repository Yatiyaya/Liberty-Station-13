// gets the announcement tag from the config and gets the channel from the TGS API
/proc/tgs_get_announce_channel()
	var/datum/tgs_api/v5/api = TGS_READ_GLOBAL(tgs)
	if(istype(api) && config.tgs_discord_round_announce_tag)
		for(var/datum/tgs_chat_channel/channel in api.chat_channels)
			if(channel.custom_tag == config.tgs_discord_round_announce_tag)
				return list(channel)
	return 0

// Sends whatever message you give it in the announcement channel
/proc/tgs_announce(var/message, )
	if(!message)
		return
	var/datum/tgs_chat_channel/announce_channel = tgs_get_announce_channel()
	if(announce_channel)
		world.TgsChatBroadcast(message,announce_channel)
	else
		return
