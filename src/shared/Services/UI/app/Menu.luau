local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement

type props = {
	toggle: boolean,
	showUI: boolean,
}

local module = {}

function module.init(props: props)
	return e(React.Fragment, nil, {
		e("Frame", {
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromScale(0.25, 0.4),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			Visible = props.toggle,
		}, {
			e("UICorner", {
				CornerRadius = UDim.new(0, 10),
			}),

			e("UIStroke", {
				Thickness = 3,
			}),

			e("TextButton", {
				Text = "X",
				TextScaled = true,
				Position = UDim2.fromScale(0.95, 0),
				AnchorPoint = Vector2.new(0.5, 0),
				Size = UDim2.fromScale(0.10, 0.05),
				BackgroundColor3 = Color3.fromRGB(255, 0, 0),
				TextColor3 = Color3.fromRGB(0, 0, 0),
				[React.Event.Activated] = props.showUI,
			}),
		}),
	})
end

return module
