local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local Ripple = require(ReplicatedStorage.Packages.Ripple)
local e = React.createElement

return function()
	local function ee()
		local spring = React.useMemo(function()
			return Ripple.createSpring(0, {
				easing = "linear",
				duration = 2,
				start = true,
			})
		end)

		task.wait(5)
		spring:setGoal(0.3)
		task.wait(5)
		spring:setGoal(0.5)

		return e("TextLabel", {
			Position = UDim2.fromScale(0.5, spring),
			Size = UDim2.fromScale(0.2, 0.1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Text = "Index",
		})
	end

	local container = Instance.new("ScreenGui")
	container.Parent = Players.LocalPlayer.PlayerGui
	container.ResetOnSpawn = false

	local root = ReactRoblox.createRoot(container)
	root:render(e(ee))
end
