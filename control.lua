require "defines"

script.on_event(defines.events.on_tick, function(event)
	if not global.clock_enabled then
		init()
	end

	update()
end)

function init()
	game.players[1].gui.left.add{type = "frame", name = "clock_game_frame"}
	game.players[1].gui.left.clock_game_frame.add{type = "label", name = "clock_game", style = "description_title_label_style"}
	global.clock_enabled = 0
end

function update()
	local time = math.fmod(game.daytime + 0.5, 1)
	local hour = math.floor(time * 24)
	local minute = math.floor((time * 24 - hour) * 60)
	if minute < 10 then
		minute = 0 .. minute
	end
	game.players[1].gui.left.clock_game_frame.clock_game.caption = hour .. ":" .. minute
	
end
