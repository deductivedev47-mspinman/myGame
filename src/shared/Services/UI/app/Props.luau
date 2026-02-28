local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Menu = require(script.Parent.Menu)
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement

local types = {}

function types.init()
	return e(React.Fragment, nil, {
		e(Menu.init, {
			Text = "Nate The Dev",
			TScaled = true,
			TColor = Color3.fromRGB(0, 255, 76),
			Size = UDim2.fromScale(0.3, 0.1),
			Position = UDim2.fromScale(0.5, 0.07),
			Color = Color3.fromRGB(0, 0, 0),
			CoRadius = UDim.new(0, 20),
		}),

		e(Menu.init, {
			Text = "Nate The Dev",
			TScaled = true,
			TColor = Color3.fromRGB(0, 0, 0),
			Size = UDim2.fromScale(0.3, 0.1),
			Position = UDim2.fromScale(0.5, 0.93),
			Color = Color3.fromRGB(102, 255, 0),
			CoRadius = UDim.new(0, 20),
		}),
	})
end

return types
