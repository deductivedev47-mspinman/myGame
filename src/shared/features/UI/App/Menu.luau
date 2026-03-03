local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
return function()
	local state, set = React.useState(false)

	React.useEffect(function()
		print(tostring(state))

		task.wait(10)
		set(not state)
		print(tostring(state))
	end, {})

	return React.createElement(React.Fragment, nil, {
		React.createElement("TextLabel", {
			Text = "Scammer",
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromScale(0.09, 0.1),
		}),
	})
end
