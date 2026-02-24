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
	local function b()
		local humanoid, setHumanoid = s(player.Character and player.Character:FindFirstChild("Humanoid"))
		local HPVal, setVal = s(100)

		f(function()
			local function onChar(char)
				local newHu = char:WaitForChild("Humanoid")
				setHumanoid(newHu)
				setVal(newHu.Health)
			end

			local variable = player.CharacterAdded:Connect(onChar)
			return function()
				variable:Disconnect()
			end
		end, {})

		f(function()
			if not humanoid then
				return
			end

			local connection = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
				setVal(humanoid.Health)
			end)

			local humanoidDied = humanoid.Died:Connect(function()
				setVal(0)
			end)

			return function()
				connection:Disconnect()
				humanoidDied:Disconnect()
			end
		end, { humanoid })

		return e(React.Fragment, nil, {
			e("Frame", {
				Position = UDim2.fromScale(0.01, 0.955),
				Size = UDim2.fromScale(0.12, 0.03),
				BackgroundColor3 = Color3.fromRGB(61, 61, 61),
			}, {
				e("UICorner", {
					CornerRadius = UDim.new(0, 30),
				}),
				e("UIStroke", {
					Thickness = 1.5,
					Color = Color3.fromRGB(255, 255, 255),
				}),

				e("Frame", {
					Size = UDim2.fromScale(humanoid / 100, 1),
					BackgroundColor3 = Color3.fromRGB(9, 255, 0),
				}, {
					e("TextLabel", {
						Text = tostring(humanoid),
						Size = UDim2.fromScale(1, 0.8),
						TextColor3 = Color3.fromRGB(0, 0, 0),
						BackgroundTransparency = 1,
						TextScaled = true,
						Font = Enum.Font.FredokaOne,
					}),
				}),
			}),
		})
	end

	local conn = Instance.new("ScreenGui")
	conn.Parent = player.PlayerGui
	conn.ResetOnSpawn = false

	local root = ReactRoblox.createRoot(conn)
	root:render(e(b))
end

function mo.HealthBarUI()
	return e("Frame", {
		Size = UDim2.fromOffset(300, 30),
		Position = UDim2.fromScale(0.02, 0.88),
		BackgroundColor3 = Color3.fromRGB(31, 31, 31),
	}, {
		e("UICorner", {
			CornerRadius = UDim.new(0, 25),
		}),

		e(
			"Frame",
			{
				Size = UDim2.fromScale(100 / 100, 1),
				BackgroundColor3 = Color3.fromRGB(102, 255, 0),
			},
			{
				e("UICorner", {
					CornerRadius = UDim.new(0, 25),
				}),
				e("UIStroke", {
					Thickness = 3,
					Color = Color3.fromRGB(168, 255, 204),
				}),
			},
			e("TextLabel", {
				Text = tostring(100),
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				TextColor3 = Color3.fromRGB(0, 0, 0),
				TextScaled = true,
				Font = Enum.Font.FredokaOne,
			})
		),
	})
end

return mo
