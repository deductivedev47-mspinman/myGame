local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement

type MenuProps = {
	Position: UDim2,
	Size: UDim2,
	Color: Color3,
	Text: string,
	TScaled: boolean,
}

local m = {}

function m.init(props: MenuProps)
	return e(React.Fragment, nil, {

		e("TextButton", {
			Text = props.Text,
			TextScaled = props.TScaled,
			Size = UDim2.fromScale(0.3, 0.3),
			Position = UDim2.fromScale(0.5, 0.5),
			BackgroundColor3 = props.Color,
			AnchorPoint = Vector2.new(0.5, 0.5),
		}),
	})
end

return m
