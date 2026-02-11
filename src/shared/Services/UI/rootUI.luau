local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Menu = require(script.Parent.Menu)
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement
local function UIRoot()
	return {
		Menu1 = e(Menu, {
			Text = "1Million Robux",
			Color = Color3.fromRGB(24, 58, 15),
			Color2 = Color3.fromRGB(255, 0, 98),
			Position = UDim2.fromScale(0.5, 0.1),
		}),
		Menu2 = e(Menu, {
			Text = "100 Concurrent Players",
			Color = Color3.fromRGB(75, 20, 141),
			Color2 = Color3.fromRGB(255, 115, 0),
			Position = UDim2.fromScale(0.5, 0.75),
		}),
	}
end

return UIRoot
