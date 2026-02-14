local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Menu = require(script.Parent.Menu)
local React = require(ReplicatedStorage.Packages.React)
local E = React.createElement

local function RootUI()
	return E(Menu)
end

return RootUI
