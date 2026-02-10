local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local rootUI = require(ReplicatedStorage.Shared.Services.UI.rootUI)

return function()
	local player = Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")
	local container = Instance.new("ScreenGui")
	container.Name = "React"
	container.IgnoreGuiInset = true
	container.ResetOnSpawn = false
	container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	container.ClipToDeviceSafeArea = false
	container.Parent = playerGui
	local root = ReactRoblox.createRoot(container)
	local app = React.createElement(rootUI)
	root:render(app)
end
