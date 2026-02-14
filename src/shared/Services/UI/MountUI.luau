local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)

return function()
	local player = Players.LocalPlayer
	local plrGui = player:WaitForChild("PlayerGui")
	local container = Instance.new("ScreenGui", plrGui)
	container.ResetOnSpawn = false
	container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	container.ClipToDeviceSafeArea = false
	container.IgnoreGuiInset = true
	local root = ReactRoblox.createRoot(container)
	local app = React.createElement(...)
	root:render(app)
end
