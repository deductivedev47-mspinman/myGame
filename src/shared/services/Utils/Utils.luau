local utils = {}

function utils.init()
	local table = {
		Robot = {
			Name = "Robo",
			Type = "Android",
			Health = 250,
		},

		Human = {
			Name = "John",
			Type = "Mortal",
			Health = 100,
		},
	}

	if table.Robot.Health > table.Human.Health then
		table.Human.Health = 120
		task.wait(10)
		print(tostring(table.Human.Health))
	end
end

return utils
