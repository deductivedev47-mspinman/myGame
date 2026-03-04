--RunService is a service that adapts to the player's device performance, so if the player has a very lag
--performance, the heartbeat will run less perhaps, same function with a good device performance.

local RunService = game:GetService("RunService")

local module = {}

function module.init()
	local part = workspace:WaitForChild("Heartbeat")
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

			part.Position = part.Position + Vector3.new(distance, 0, 0)
		end)

		task.wait(4)
		connection:Disconnect()
	end

	module.stepped()
end

return module
