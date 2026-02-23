local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement
local event = React.Event
local sou = ReplicatedStorage.Sound["pop!"]

local mo = {}

function mo.init(props)
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
			[event.MouseButton1Click] = function()
				setVal(not rawVal)
				sou:Play()
				task.wait(0.25)
				sou:Stop()
			end,
		}, {
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
