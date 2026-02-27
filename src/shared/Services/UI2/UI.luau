local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local Ripple = require(ReplicatedStorage.Packages.Ripple)
local e = React.createElement
local event = React.Event

return function()
	local val, setval = React.useState(0 or nil)
	--boolean
	local bool, setbool = React.useState(false)

	local twen = Ripple.createTween(val, {
		easing = "expoInOut",
		duration = 0.5,
		start = true,
	})

	React.useEffect(function()
		twen:onChange(function(value)
			setval(value)
		end)
	end, { twen })

	React.useEffect(function()
		if bool == true then
			twen:setGoal(0.2)
		else
			twen:setGoal(0.3)
		end
	end, { twen })

	return e("TextButton", {
		Size = UDim2.fromScale(0.3, 0.2),
		Position = UDim2.fromScale(0.5, val),
		AnchorPoint = Vector2.new(0.5, 0.5),
		[event.Activated] = function()
			setbool(not bool)
		end,
	})
end
