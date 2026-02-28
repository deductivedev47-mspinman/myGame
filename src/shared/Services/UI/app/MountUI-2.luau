local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RootUI = require(script.Parent.RootUI)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement

return function()
	local gui = Players.LocalPlayer.PlayerGui
	local container = Instance.new("ScreenGui")
	container.Parent = gui
	container.ResetOnSpawn = false
	container.ClipToDeviceSafeArea = false
	container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	container.IgnoreGuiInset = true
	container.Name = "app"

	local root = ReactRoblox.createRoot(container)
	root:render(e(React.Fragment, nil, {
		e(RootUI.init),
	}))
end
