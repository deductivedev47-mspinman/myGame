local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RippleUI = require(script.Parent.RippleUI)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement

return function()
	local container = Instance.new("ScreenGui")
	container.ResetOnSpawn = false
	container.Parent = Players.LocalPlayer.PlayerGui

	local root = ReactRoblox.createRoot(container)
	root:render(e(RippleUI))
end
