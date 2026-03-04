--RunService is a service that adapts to the player's device performance, so if the player has a very lag
--performance, the heartbeat will run less perhaps, same function with a good device performance.

local RunService = game:GetService("RunService")

local module = {}

function module.init()
	local part = workspace:WaitForChild("Heartbeat")
	local part2 = workspace:WaitForChild("Stepped")
	--heartbeat
	function module.heartbeat()
		local connection = RunService.Heartbeat:Connect(function(dt)
			local time = dt * -10
			print(dt)
			part.Position = part.Position + Vector3.new(time, 0, 0)
		end)

		task.wait(4)
		connection:Disconnect()
	end

	function module.stepped()
		local connection = RunService.Stepped:Connect(function(durationT, dt)
			local distance = dt * -10
			print(dt)

			part2.Position = part2.Position + Vector3.new(distance, 0, 0)
		end)

		task.wait(4)
		connection:Disconnect()
	end
	module.heartbeat()
end

function module.dt()
	RunService.Heartbeat:Connect(function(dt)
		print(dt * 10)
	end)
end

return module
