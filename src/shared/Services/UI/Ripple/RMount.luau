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
		local NUM = 1
		local spring = createSpring(NUM, {
			tension = 3,
			friction = 1,
			frequency = 3,
			start = true,
		})

		local val, setVal = React.useBinding(NUM)

		React.useEffect(function()
			spring:onChange(function(value)
				setVal(value)
			end)
		end)

		return e("TextButton", {
			Text = "Nate",
			TextColor3 = Color3.fromRGB(255, 38, 0),
			TextScaled = true,
			Position = UDim2.fromScale(0.96, 0.45),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromScale(0.05, 0.08),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 0.6,
			[event.MouseEnter] = function()
				spring:setGoal(1.3)
			end,
			[event.MouseLeave] = function()
				spring:setGoal(1)
			end,
		}, {
			e("UICorner", {
				CornerRadius = UDim.new(0, 12),
			}),
			e("UIStroke", {
				Thickness = 1,
				Color = Color3.fromRGB(255, 255, 255),
			}),
			e("UIScale", {
				Scale = val,
			}),
		})
	end

	local container = Instance.new("ScreenGui")
	container.Name = "Ripple"
	container.Parent = Players.LocalPlayer.PlayerGui

	local root = ReactRoblox.createRoot(container)
	root:render(e(Button))
end

function ripple.UI()
	return e("TextButton", {
		Text = "Nate",
		TextColor3 = Color3.fromRGB(255, 38, 0),
		TextScaled = true,
		Position = UDim2.fromScale(0.93, 0.45),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.fromScale(0.05, 0.08),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 0.6,
	}, {
		e("UICorner", {
			CornerRadius = UDim.new(0, 12),
		}),
		e("UIStroke", {
			Thickness = 1,
			Color = Color3.fromRGB(255, 255, 255),
		}),
	})
end

return ripple
