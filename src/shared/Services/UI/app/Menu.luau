local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement

type menuProps = {
	Text: string,
	TextColor3: Color3,
	BackgroundColor3: Color3,
}

local function menu(stats: menuProps)
	return e("Frame", {
		Size = UDim2.fromScale(0.3, 0.4),
		Position = UDim2.fromScale(0.5, 0.5),
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

		e("TextButton", {
			Text = "Click",
			TextScaled = true,
			AnchorPoint = Vector2.new(0.5, 0.1),
			Position = UDim2.fromScale(0.5, 1),
			TextColor3 = stats.TextColor3,
			Size = UDim2.fromScale(0.3, 0.15),
			BackgroundColor3 = stats.BackgroundColor3,
		}, {
			e("UIStroke", {
				Thickness = 1.25,
			}),

			e("UICorner", {
				CornerRadius = UDim.new(0, 30),
			}),
		}),
	})
end

return menu
