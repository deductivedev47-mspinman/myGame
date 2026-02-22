local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement
local event = React.Event

local react = {}

function react.UI(self: any)
	return e("TextButton", {
		Text = "NateTheDev",
		TextScaled = true,
		Position = UDim2.fromScale(0.5, 0.4),
		Size = UDim2.fromScale(0.5, 0.3),
		AnchorPoint = Vector2.new(0.5, 0.45),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),

		[event.MouseButton1Click]
	})
end

return react
