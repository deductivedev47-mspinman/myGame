local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement
local event = React.Event

local react = {}

function react:UI()
	local isVisible, setIsVisible = React.useState(true)

	return e(
		React.Fragment,
		nil,
		e(
			"Frame",
			{
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 0.5,
				Position = UDim2.fromScale(0.5, 0.33),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.fromScale(0.3, 0.35),
				Visible = isVisible,
			},
			e("UICorner", {
				CornerRadius = UDim.new(0, 12),
			}),
			e("UIStroke", {
				Color = Color3.fromRGB(255, 255, 255),
				Thickness = 5,
			})
		),

		e("TextButton", {
			Size = UDim2.fromScale(0.045, 0.07),
			Position = UDim2.fromScale(0.028, 0.55),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Text = "Menu",
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(58, 58, 58),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 0.5,
			[event.MouseButton1Click] = function()
				setIsVisible(function(prev)
					return not prev
				end)
			end,
		}, {
			e("UICorner", {
				CornerRadius = UDim.new(0, 12),
			}),

			e("UIStroke", {
				Thickness = 2,
				Color = Color3.fromRGB(),
			}),
		})
	)
end

return react
