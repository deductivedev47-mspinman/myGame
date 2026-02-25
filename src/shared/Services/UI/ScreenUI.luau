local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local MainReact = require(ReplicatedStorage.Shared.Services.UI.React.MainReact)

local player = Players.LocalPlayer

local UI = {}

function UI.react()
	local ui = Instance.new("ScreenGui")
	ui.Parent = player.PlayerGui
	ui.IgnoreGuiInset = true
	ui.ClipToDeviceSafeArea = false
	ui.ResetOnSpawn = false
	ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ui.Name = "React UI"
	local root = ReactRoblox.createRoot(ui)
	local app = React.createElement(MainReact.init)
	root:render(app)
end

return UI
