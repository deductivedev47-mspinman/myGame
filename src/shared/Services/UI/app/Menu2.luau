local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement

type menuProps = {
	Text: string,
	TextColor3: Color3,
	BackgroundColor3: Color3,
	Position: UDim2,
	onActivated: boolean,
}

local function menu2(stats: menuProps)
	return e("Frame", {
		Size = UDim2.fromScale(0.3, 0.4),
		Position = stats.Position,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = stats.BackgroundColor3,
	}, {
		e("UICorner", {
			CornerRadius = UDim.new(0, 10),
		}),

		e("UIStroke", {
			Thickness = 5,
			Color = stats.TextColor3,
		}),

		e("TextLabel", {
			Text = stats.Text,
			TextScaled = true,
			TextColor3 = Color3.fromRGB(0, 0, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromScale(0.8, 0.8),
			BackgroundTransparency = 1,
		}),

		e("TextButton", {
			Text = "Click",
			TextScaled = true,
			AnchorPoint = Vector2.new(0.5, 0.1),
			Position = UDim2.fromScale(0.5, 0.9),
			TextColor3 = stats.TextColor3,
			Size = UDim2.fromScale(0.3, 0.15),
			BackgroundColor3 = Color3.fromRGB(4, 5, 70),
			[React.Event.Activated] = stats.onActivated,
		}, {
			e("UIStroke", {
				Thickness = 2,
			}),

			e("UICorner", {
				CornerRadius = UDim.new(0, 30),
			}),
		}),
	})
end

return menu2
