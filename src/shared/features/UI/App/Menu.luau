local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement

return function()
	local state, set = React.useState(false)

	React.useEffect(function()
		print(tostring(state))

		task.wait(10)
		set(not state)
		print(tostring(state))
	end, {})

	return e(React.Fragment, nil, {
		e("Frame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = Color3.fromRGB(255, 0, 0),
			BorderSizePixel = 0,
		}, {
			e("TextLabel", {
				Size = UDim2.fromScale(1, 1),
				Text = "Hello World",
				TextColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
			}),
		}),
	})
end
