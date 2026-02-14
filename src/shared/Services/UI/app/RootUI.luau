local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Menu = require(script.Parent.Menu)
local Menu2 = require(script.Parent.Menu2)
local React = require(ReplicatedStorage.Packages.React)
local E = React.createElement

local function RootUI()
	local currentflow, setflow = React.useState(false)

	return E(React.Fragment, nil, {
		Menu = E(Menu, {
			Text = "Shop 1",
			TextColor3 = Color3.fromRGB(4, 0, 255),
			BackgroundColor3 = Color3.fromRGB(117, 159, 228),
			Position = UDim2.fromScale(0.7, 0.5),
			TextScaled = currentflow,
		}),

		Menu2 = E(Menu2, {
			Text = "Shop 2",
			TextColor3 = Color3.fromRGB(1, 34, 16),
			BackgroundColor3 = Color3.fromRGB(153, 0, 255),
			Position = UDim2.fromScale(0.2, 0.5),
			onActivated = function() -- Changed to a regular prop
				setflow(not currentflow)
			end,
		}),
	})
end

return RootUI
