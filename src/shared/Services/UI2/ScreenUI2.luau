local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UI = require(script.Parent.UI)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement

return function()
	local container = Instance.new("ScreenGui")
	container.Name = "MAIN UI"
	container.Parent = Players.LocalPlayer.PlayerGui
	container.ResetOnSpawn = false

	local root = ReactRoblox.createRoot(container)
	root:render(e(React.Fragment, nil, {
		-- e(UI),
	}))
end
