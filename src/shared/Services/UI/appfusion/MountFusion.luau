local Players = game:GetService("Players")
local FusionMenu = require(script.Parent.FusionMenu)
local module = {}

function module.init()
	local gui = Players.LocalPlayer:WaitForChild("PlayerGui")
	local container = Instance.new("ScreenGui", gui)
	container.ResetOnSpawn = false
	container.ClipToDeviceSafeArea = false
	container.IgnoreGuiInset = true
	container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	container.Name = "Gui"
	FusionMenu.init(container)
end

return module
