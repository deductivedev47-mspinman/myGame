local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local Ripple = require(ReplicatedStorage.Packages.Ripple)
local createSpring = Ripple.createSpring
local createTween = Ripple.createTween
local e = React.createElement
local event2 = React.Event
local event = React.Event
local sou = ReplicatedStorage.Sound["pop!"]

local mo = {}

function mo.init()
	local NUM = 1

	local val, set = React.useBinding(NUM)

	local spring = React.useMemo(function()
		return createSpring(NUM, {
			tension = 3,
			friction = 1,
			frequency = 3,
			start = true,
		})
	end)

	local pos, setPos = React.useBinding(UDim2.fromScale(0, 0))
	local yAxis = pos.Y

	local tween = createTween(0, {
		easing = "linear",
		duration = 3,
		start = true,
	})

	tween:onChange(function(self: UDim2)
		setPos()
	end)

	spring:onChange(function(self)
		set(self)
	end)

	local rawVal, setVal = React.useState(false)

	return e(React.Fragment, nil, {
		e("Frame", {
			Size = UDim2.fromScale(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.1,
			Visible = rawVal,
		}, {
			e("TextLabel", {
				Text = "Shop",
				TextScaled = true,
				Size = UDim2.fromOffset(100, 30),
				Position = UDim2.fromScale(0.5, 0.05),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 0.5,
				TextColor3 = Color3.fromRGB(0, 0, 0),
			}, {
				e("UICorner", {
					CornerRadius = UDim.new(0, 50),
				}),
			}),

			e("UICorner", {
				CornerRadius = UDim.new(0, 6),
			}),

			e("UIStroke", {
				Thickness = 10,
				Color = Color3.fromRGB(255, 0, 43),
			}),
		}),

		e("ImageButton", {
			Size = UDim2.fromScale(0.05, 0.09),
			Position = UDim2.fromScale(0.005, 0.55),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundTransparency = 0.5,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Image = "rbxassetid://122026226288611",
			[event2.MouseButton1Click] = function()
				setVal(not rawVal)
				sou:Play()
				task.wait(0.25)
				sou:Stop()
			end,
			[event.MouseEnter] = function()
				spring:setGoal(1.3)
			end,
			[event.MouseLeave] = function()
				spring:setGoal(1.01)
			end,
		}, {
			e("UIScale", {
				Scale = val,
			}),

			e("UICorner", {
				CornerRadius = UDim.new(0, 5),
			}),

			e("UIStroke", {
				Thickness = 0.9,
			}),
		}),
	})
end

return mo
