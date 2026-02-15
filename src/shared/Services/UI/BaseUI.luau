local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local RootUI = require(ReplicatedStorage.Shared.Services.UIFusion.app.RootUI)

local ui = {}

function ui.init()
	local player = Players.LocalPlayer:WaitForChild("PlayerGui")
	local container = Instance.new("ScreenGui", player)
	container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	container.ResetOnSpawn = false
	container.IgnoreGuiInset = true
	container.ClipToDeviceSafeArea = false
	container.Name = "Shop Gui"
	local root = ReactRoblox.createRoot(container)
	local app = React.createElement(RootUI.init)

	root:render(app)
end

return ui
