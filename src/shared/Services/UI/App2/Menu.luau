local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local React = require(ReplicatedStorage.Packages.React)
local Ripple = require(ReplicatedStorage.Packages.Ripple)
local e = React.createElement

return function()
	local value, setValue = React.useBinding(0)

	local spring = Ripple.createSpring(0, {
		tension = 20,
		friction = 40,
		start = true,
	})

	React.useEffect(function()
		spring:onChange(function(newVal)
			setValue(newVal)
			print(newVal)
		end)

		UserInputService.InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.E then
				spring:setGoal(0.5)
			elseif input.KeyCode == Enum.KeyCode.Q then
				spring:setGoal(0.8)
			end
		end)
	end, {})

	return e("Frame", {
		Size = UDim2.fromScale(0.3, 0.2),
		Position = value:map(function(v)
			return UDim2.fromScale(0.5, v)
		end),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(187, 255, 0),
	})
end
