local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ReplicatedStorage.Packages.DataService).server
local data = {}

function data.init()
	DataService:initialize()
end

return data
