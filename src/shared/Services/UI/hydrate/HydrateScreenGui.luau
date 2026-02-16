local Players = game:GetService("Players")

local HydrateClient = require(script.Parent.HydrateClient)

local module = {}

function module.init()
	local player = Players.LocalPlayer
	if player.UserId == 3834581988 then
		local playerGui = player:WaitForChild("PlayerGui")
		local container = Instance.new("ScreenGui", playerGui)
		container.ResetOnSpawn = false
		container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		container.ClipToDeviceSafeArea = false
		container.IgnoreGuiInset = true
		container.Name = "AdminMain"
		HydrateClient.init(container)
	else
		print("Nope")
	end
end

return module
