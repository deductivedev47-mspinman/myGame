local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FusionUI = require(ReplicatedStorage.Shared.Services.UI.Fusion.FusionUI)
local ReactUI = require(ReplicatedStorage.Shared.Services.UI.React.ReactUI)

local player = Players.LocalPlayer

local UI = {}

function UI.fusion()
	local screenGui = Instance.new("ScreenGui", player:FindFirstChild("PlayerGui"))
	screenGui.IgnoreGuiInset = true
	screenGui.ClipToDeviceSafeArea = false
	screenGui.ResetOnSpawn = false
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.Name = "UI"
	FusionUI.spring(screenGui)
end

function UI.react()
	local ui = Instance.new("ScreenGui", player:FindFirstChild("PlayerGui"))
	ui.IgnoreGuiInset = true
	ui.ClipToDeviceSafeArea = false
	ui.ResetOnSpawn = false
	ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ui.Name = "React UI"
	ReactUI.UI(ui)
end

return UI
