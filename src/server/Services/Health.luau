local Players = game:GetService("Players")
local REGEN_RATE = 1
local REGEN_STEP = 2.5
local mo = {}

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local humanoid = character:WaitForChild("Humanoid")

		local defaultScript = character:FindFirstChild("Health")
		if defaultScript then
			defaultScript.Disabled = true
		end

		task.spawn(function()
			while humanoid and humanoid.Health > 0 do
				task.wait(REGEN_STEP)
				if humanoid.Health < humanoid.MaxHealth then
					humanoid.Health = math.min(humanoid.Health + REGEN_RATE, humanoid.MaxHealth)
				end
			end
		end)
	end)
end)

return mo
