local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local React = require(ReplicatedStorage.Packages.React)

local e = React.createElement

type menuProps = {
	Text: string,
	Color: Color3,
	Position: UDim2,
}

local function Menu(props: menuProps)
	local rawVal, setVal = React.useState(0)
	--Rotation
	local rot, setRot = React.useBinding(0)
	React.useEffect(function()
		local con = RunService.Heartbeat:Connect(function(self)
			setRot(rot:getValue() + self * 360)
		end)

		return function()
			con:Disconnect()
		end
	end, { rot })

	return e("Frame", {
		Size = UDim2.fromScale(0.25, 0.25),
		Position = props.Position,
		AnchorPoint = Vector2.new(0.5, 0.25),
		BackgroundColor3 = props.Color,
	}, {
		Button = e("TextButton", {
			Text = "Pressed " .. rawVal .. " times",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 1.07),
			Size = UDim2.fromScale(0.35, 0.35),
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(32, 255, 3),
			TextColor3 = Color3.fromRGB(0, 0, 0),
			Rotation = rot,
			[React.Event.Activated] = function()
				setVal(rawVal + 1)
			end,
		}),

		UICorner = e("UICorner", {
			CornerRadius = UDim.new(0, 10),
		}),

		Stroke = e("UIStroke", {
			Thickness = 5,
			Color = Color3.fromRGB(0, 0, 0),
		}),

		Text = e("TextLabel", {
			Size = UDim2.fromScale(0.75, 0.75),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundTransparency = 1,
			TextScaled = true,
			TextColor3 = Color3.fromRGB(0, 0, 0),
			Text = props.Text,
		}),
	})
end

return function(props: menuProps)
	local shown, setShown = React.useState(true)
	React.useEffect(function()
		local conn = UserInputService.InputBegan:Connect(function(keybind)
			if keybind.KeyCode == Enum.KeyCode.T then
				setShown(not shown)
			end
		end)

		return function()
			conn:Disconnect()
		end
	end, { shown })

	if shown then
		return e(Menu, props)
	else
		return nil
	end
end
