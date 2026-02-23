local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local player = Players.LocalPlayer
local e = React.createElement
local f = React.useEffect
local s = React.useState

local mo = {}

function mo.init()
	local function healthState()
		local char = player.Character or player.CharacterAdded:Wait()
		local humanoid = char:FindFirstChild("Humanoid")
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
			BackgroundTransparency = 0.55,
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
	root:render(e(healthState))
end

function mo.HealthBar()
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:FindFirstChild("Humanoid")

	local function bar()
		local health, set = s(humanoid.Health)

		f(function()
			local connection = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
				set(humanoid.Health)
			end)
			return function()
				connection:Disconnect()
			end
		end, {})

		return e(React.Fragment, nil, {
			e("Frame", { -- background/border
				Size = UDim2.fromOffset(300, 30),
				Position = UDim2.fromScale(0.02, 0.88),
				BackgroundColor3 = Color3.fromRGB(40, 40, 40),
			}, {
				e("UIStroke", {
					Thickness = 6,
				}),
				e("UICorner", {
					CornerRadius = UDim.new(0, 15),
				}),
				e("Frame", { -- the green fill
					Size = UDim2.fromScale(health / 100, 1), -- shrinks as health drops
					BackgroundColor3 = Color3.fromRGB(0, 200, 0),
				}, {
					e("UIStroke", {
						Thickness = 6,
					}),
					e("UICorner", {
						CornerRadius = UDim.new(0, 15),
					}),
				}),
				e("TextLabel", { -- the number
					Text = tostring(health),
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextScaled = true,
				}),
			}),
		})
	end

	local container = Instance.new("ScreenGui")
	container.Parent = player.PlayerGui
	container.ResetOnSpawn = false

	local root = ReactRoblox.createRoot(container)
	root:render(e(bar))
end

return mo
