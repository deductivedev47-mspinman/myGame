local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Utils = require(ReplicatedStorage.Shared.services.Utils.Utils)
local ids = Utils().ids

return function()
	print(ids.Holding)
end
