local Players = game:GetService("Players")

local mo = {}

Players.PlayerAdded:Connect(function(self: Player)
	self.CharacterAdded:Connect(function(self)
		print("BataBata Spawned")
		local humanoid = self:FindFirstChild("Humanoid")
		humanoid.Died:Connect(function()
			print("Bababoi")
		end)
	end)
end)

return mo
