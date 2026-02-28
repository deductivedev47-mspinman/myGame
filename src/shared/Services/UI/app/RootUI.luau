local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Menu = require(script.Parent.Menu)
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement

local types = {}

function types.init()
	return e(Menu.init, {
		Text = "Nate The Dev",
		TScaled = true,
		Size = UDim2.fromScale(0.2, 0.3),
		Position = UDim2.fromScale(0.5, 0.4),
		Color = Color3.fromRGB(255, 94, 0),
	})
end

return types
