round = {}

-- Variables
round.Break	= 30	-- 30 second breaks
round.Time	= 300	-- 5 minute rounds

-- Read Variables
round.TimeLeft = -1
round.Breaking = false

function round.Broadcast(Text)
	for k, v in pairs(player.GetAll()) do
		v:ConCommand("play buttons/button17.wav")
		v:ChatPrint(Text)
	end
end

function round.Begin()
	-- Your code
	-- (Anything that may need to happen when the round begins)
	
	round.Broadcast("Round starting! Round ends in " .. round.Time .. " seconds!")
	round.TimeLeft = round.Time
end

function round.End()
	-- Your code
	-- (Anything that may need to happen when the round ends)
	
	round.Broadcast("Round over! Next round in " .. round.Break .. " seconds!")
	round.TimeLeft = round.Break
end

function round.Handle()
	if (round.TimeLeft == -1) then -- Start the first round
		round.Begin()
		return
	end
	
	round.TimeLeft = round.TimeLeft - 1
	
	if (round.TimeLeft == 0) then
		if (round.Breaking) then
			round.Begin()
			round.Breaking = false
		else
			round.End()
			round.Breaking = true
		end
	end
end
timer.Create("round.Handle", 1, 0, round.Handle)

