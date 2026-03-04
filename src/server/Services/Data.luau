local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ReplicatedStorage.Packages.DataService).server

local Data = {}

DataService:init({
	template = {
		Level = 100,
		Rank = "Beginner",
		Inventory = {},
	},
})

Players.PlayerAdded:Connect(function(player)
	DataService:waitForData(player)
	DataService:set(player, "Inventory", { "Shield", "Health Potion", "Admin Ban Hammer" })

	local template = DataService:get(player)

	print(template)
end)

return Data
