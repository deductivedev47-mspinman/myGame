local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local player = Players.LocalPlayer
local e = React.createElement
local f = React.useEffect
local s = React.useState
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:FindFirstChild("Humanoid")

local mo = {}

function mo.init()
	local function healthBar()
		local raw, set = s(humanoid.Health)

		f(function()
			local telepathy = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
				set(humanoid.Health)
			end)

			return function()
				telepathy:Disconnect()
			end
		end, {})

		return e("TextLabel", {
			Text = "HP: " .. raw,
			TextColor3 = Color3.fromRGB(0, 17, 255),
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(9, 255, 0),
			Position = UDim2.fromScale(0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.2),
			Size = UDim2.fromScale(0.2, 0.1),
		}, {
			e("UICorner", {
				CornerRadius = UDim.new(0, 11),
			}),
		})
	end

	local container = Instance.new("ScreenGui")
	container.Parent = player.PlayerGui
	container.ResetOnSpawn = false
	local root = ReactRoblox.createRoot(container)
	root:render(e(healthBar))
end

return mo
