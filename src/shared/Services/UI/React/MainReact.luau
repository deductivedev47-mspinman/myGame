local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local Ripple = require(ReplicatedStorage.Packages.Ripple)
local createSpring = Ripple.createSpring
local createTween = Ripple.createTween
local e = React.createElement
local event2 = React.Event
local event = React.Event
local bool: boolean = false
local sou = ReplicatedStorage.Sound["pop!"]

local mo = {}

function mo.init()
	local val, set = React.useState(1)

	local pos, setPos = React.useState(0 or nil)

	local rawVal, setVal = React.useState(false)

	local spring = React.useMemo(function()
		return createSpring(val, {
			tension = 3,
			friction = 1,
			frequency = 3,
			start = true,
		})
	end)

	local tween = React.useMemo(function()
		return createTween(pos, {
			easing = "expoOut",
			duration = 0.7,
			start = true,
		})
	end)

	React.useEffect(function()
		tween:onChange(function(value)
			setPos(value)
		end)
	end, { tween })

	React.useEffect(function()
		spring:onChange(function(self)
			set(self)
		end)
	end, { spring })

	React.useEffect(function()
		if rawVal == true then
			tween:setGoal(0.5)
		else
			tween:setGoal(-1)
		end
	end, { rawVal })

	return e(React.Fragment, nil, {
		e("Frame", {
			Size = UDim2.fromScale(0.5, 0.5),
			Position = UDim2.fromScale(0.5, pos),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.1,
			Visible = true,
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
			[event2.Activated] = function()
				if not bool then
					bool = true
					setVal(not rawVal)
					sou.TimePosition = 0.145
					sou:Play()
					task.delay(0.8, function()
						bool = false
					end)
				end
			end,
			[event.MouseEnter] = function()
				spring:setGoal(1.2)
			end,
			[event.MouseLeave] = function()
				spring:setGoal(1)
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
