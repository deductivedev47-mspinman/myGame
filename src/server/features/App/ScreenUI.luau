local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local React = require(ReplicatedStorage.Packages.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement
local myAtom = Charm.atom(0)
local useAtom = ReactCharm.useAtom
local num = 0

local mo = {}

Charm.subscribe(myAtom, function(newValue)
	print(newValue)
end)

function mo.UI()
	local count = useAtom(myAtom)
	return e("TextLabel", {
		Position = UDim2.fromScale(0.97, 0.04),
		AnchorPoint = Vector2.new(1, 0),
		Size = UDim2.fromScale(0.07, 0.06),
		Text = tostring(count),
		TextScaled = true,
	}, {
		e("UICorner", {
			CornerRadius = UDim.new(0, 12),
		}),
	})
end

function mo.init()
	Players.PlayerAdded:Connect(function(player)
		num += 1
		myAtom(num)
		local Gui = player.PlayerGui

		local container = Instance.new("ScreenGui")
		container.Parent = Gui
		container.Name = "PlayerCount"
		container.ResetOnSpawn = false
		container.ClipToDeviceSafeArea = false
		container.IgnoreGuiInset = true
		container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

		local root = ReactRoblox.createRoot(container)
		root:render(e(mo.UI))
	end)

	Players.PlayerRemoving:Connect(function()
		num -= 1
		myAtom(num)
	end)
end

return mo
