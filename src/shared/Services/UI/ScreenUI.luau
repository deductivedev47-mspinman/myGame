local Players = game:GetService("Players")
local FusionUI = require(script.Parent.FusionUI)
local player = Players.LocalPlayer

local UI = {}

local screenGui = Instance.new("ScreenGui", player:FindFirstChild("PlayerGui"))
screenGui.IgnoreGuiInset = true
screenGui.ClipToDeviceSafeArea = false
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Name = "UI"
FusionUI.spring(screenGui)

return UI
