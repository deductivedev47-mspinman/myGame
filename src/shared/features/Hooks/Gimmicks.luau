local mo = {}

function mo.init()
	local gimmicks = {
		Target = "Player's attention to spend robux",

		Gimick1 = {
			Name = "Gimick1",
			Description = "This is the first gimmick.",
			Effect = "Increases player speed by 10% for 30 seconds.",
		},

		Gimick2 = {
			Name = "Gimick2",
			Description = "This is the second gimmick.",
			Effect = "Grants player a temporary shield that absorbs damage for 20 seconds.",
		},

		Gimick3 = {
			Name = "Gimick3",
			Description = "This is the third gimmick.",
			Effect = "Doubles the player's jump height for 15 seconds.",
		},
	}

	print(gimmicks.Target)
end

return mo
