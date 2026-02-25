local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local Ripple = require(ReplicatedStorage.Packages.Ripple)
local createSpring = Ripple.createSpring
local e = React.createElement
local event = React.Event

local ripple = {}

function ripple.init()
	local function Button()
		local spring = createSpring(1, {
			tension = 50,
			friction = 20,
			start = true,
		})

		spring:setGoal()

		local val, setVal = React.useBinding("String")

		return e("TextLabel", {
			Text = val:map(function(value)
				return "Y axis = " .. value
			end),
			Position = UDim2.fromScale(0.5, 0.3),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromScale(0.3, 0.2),
		})
	end

	local container = Instance.new("ScreenGui")
	container.Name = "Ripple"
	container.Parent = Players.LocalPlayer.PlayerGui

	local root = ReactRoblox.createRoot(container)
	root:render(e(Button))
end

return ripple
