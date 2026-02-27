local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local Ripple = require(ReplicatedStorage.Packages.Ripple)
local e = React.createElement
local event = React.Event

return function()
	local val, set = React.useState(0 or nil)

	local tween = React.useMemo(function()
		return Ripple.createTween(val, {
			easing = "linear",
			duration = 1,
			start = true,
		})
	end)

	React.useEffect(function()
		tween:onChange(function(value)
			print(value)
			set(value)
		end)
	end, { tween })

	return e(React.Fragment, nil, {
		e("TextButton", {
			Position = UDim2.fromScale(0.5, val),
			AnchorPoint = Vector2.new(0.5, val),
			Size = UDim2.fromScale(0.2, 0.1),
			Text = "Index",
			[event.MouseButton1Click] = function()
				tween:setGoal(0.5)
			end,
			[event.MouseButton2Click] = function()
				tween:setGoal(-0.2)
			end,
		}),
	})
end
