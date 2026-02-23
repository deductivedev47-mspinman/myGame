local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local player = Players.LocalPlayer

return function()
	local function HealthBar(props)
		local health, setHealth = React.useState(100)

		React.useEffect(function()
			local character = player.Character or player.CharacterAdded:Wait()
			local humanoid = character:WaitForChild("Humanoid")

			local connection = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
				setHealth(humanoid.Health)
			end)

			return function()
				connection:Disconnect()
			end
		end, {})

		return React.createElement("TextLabel", {
			Text = "HP: " .. tostring(health),
			Size = UDim2.fromOffset(200, 50),
			Position = UDim2.fromScale(0.5, 0.1),
			AnchorPoint = Vector2.new(0.5, 0),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
		})
	end

	-- Create a ScreenGui to put the UI inside
	local screenGui = Instance.new("ScreenGui")
	screenGui.ResetOnSpawn = false
	screenGui.Parent = player.PlayerGui

	-- Create the React root and mount the component 👇 this is what was missing
	local root = ReactRoblox.createRoot(screenGui)
	root:render(React.createElement(HealthBar))
end
