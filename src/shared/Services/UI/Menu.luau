local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement

type menuProps = {
	Text: string,
	Color: Color3,
	UD: UDim2,
}

local function Menu(props: menuProps)
	return e("Frame", {
		Size = props.UD,
		Position = props.UD,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = props.Color,
	}, {
		UICorner = e("UICorner", {
			CornerRadius = UDim.new(0, 10),
		}),

		Stroke = e("UIStroke", {
			Thickness = 8,
		}),

		Text = e("TextLabel", {
			Size = UDim2.fromScale(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			TextScaled = true,
			TextColor3 = Color3.fromRGB(0, 255, 98),
			Text = props.Text,
		}),
	})
end

return Menu
