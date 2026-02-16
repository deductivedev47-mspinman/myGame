local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")

local InventoryServiceServer = require(ServerScriptService.Services.InventoryService.InventoryServiceServer)

Players.PlayerAdded:Connect(function(player)
	InventoryServiceServer.Shop(player)
end)
