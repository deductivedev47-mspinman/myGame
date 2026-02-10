local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement

type menuProps = {
	Text: string,
	Color: Color3,
	Position: UDim2,
}

local function Menu(props: menuProps)
	return e("Frame", {
		Size = UDim2.fromScale(0.25, 0.25),
		Position = props.Position,
		AnchorPoint = Vector2.new(0.5, 0.25),
		BackgroundColor3 = props.Color,
	}, {
		UICorner = e("UICorner", {
			CornerRadius = UDim.new(0, 10),
		}),

		Stroke = e("UIStroke", {
			Thickness = 5,
			Color = Color3.fromRGB(0, 0, 0),
		}),

		Text = e("TextLabel", {
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			TextScaled = true,
			TextColor3 = Color3.fromRGB(0, 0, 0),
			Text = props.Text,
		}),
	})
end

return Menu
