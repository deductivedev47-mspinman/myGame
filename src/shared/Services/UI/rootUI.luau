local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Menu = require(script.Parent.Menu)
local React = require(ReplicatedStorage.Packages.React)
local e = React.createElement
local function UIRoot()
	return {
		Menu1 = e(Menu, {
			Text = "NateTheDev",
			Color = Color3.fromRGB(255, 56, 6),
			Position = UDim2.fromScale(0.5, 0.1),
		}),
		Menu2 = e(Menu, {
			Text = "UI Goku",
			Color = Color3.fromRGB(130, 21, 255),
			Position = UDim2.fromScale(0.5, 0.75),
		}),
		Menu3 = e(Menu, {
			Text = "UI",
			Color = Color3.fromRGB(130, 21, 255),
			Position = UDim2.fromScale(0.17, 0.43),
		}),
		Menu4 = e(Menu, {
			Text = "UI",
			Color = Color3.fromRGB(255, 255, 255),
			Position = UDim2.fromScale(0.84, 0.43),
		}),
	}
end

return UIRoot
