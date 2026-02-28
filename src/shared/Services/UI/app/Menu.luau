local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement

type MenuProps = {
	Position: UDim2,
	Size: UDim2,
	Color: Color3,
	Text: string,
	TScaled: boolean,
	TColor: Color3,
	CoRadius: UDim,
}

local m = {}

function m.init(props: MenuProps)
	return e(React.Fragment, nil, {

		e("TextButton", {
			Text = props.Text,
			TextScaled = props.TScaled,
			TextColor3 = props.TColor,
			Size = props.Size,
			Position = props.Position,
			BackgroundColor3 = props.Color,
			AnchorPoint = Vector2.new(0.5, 0.5),
		}, {
			e("UICorner", {
				CornerRadius = props.CoRadius,
			}),
		}),
	})
end

return m
