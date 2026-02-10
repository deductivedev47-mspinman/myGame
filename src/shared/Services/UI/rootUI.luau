local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Menu = require(script.Parent.Menu)
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement
local function UIRoot()
	return e(Menu, {
		Text = "Hello Fellows",
		Color = Color3.fromRGB(54, 54, 54),
		UD = UDim2.fromScale(0.5, 0.5),
	})
end

return UIRoot
