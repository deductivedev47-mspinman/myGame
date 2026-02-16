local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)
local scope = Fusion.scoped(Fusion)
local c = scope.Children
local showUI = scope:Value(true)
local event = scope.OnEvent
local boto: RemoteEvent = ReplicatedStorage:WaitForChild("Boto")

boto.OnClientEvent:Connect(function()
	showUI:set(true)
end)

local module = {}

function module.init(parent)
	return scope:New("Frame")({
		Name = "MainFrame",
		Parent = parent,
		Position = UDim2.fromScale(0.5, 0.3),
		AnchorPoint = Vector2.new(0.5, 0.3),
		Size = UDim2.fromScale(0.3, 0.4),
		Visible = showUI,

		[c] = {
			scope:New("UIStroke")({
				Thickness = 4,
			}),

			scope:New("UICorner")({
				CornerRadius = UDim.new(0, 20),
			}),

			scope:New("TextButton")({
				TextScaled = true,
				Text = "X",
				AutoButtonColor = true,
				TextColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundColor3 = Color3.fromRGB(255, 0, 0),
				Size = UDim2.fromScale(0.08, 0.1),
				Position = UDim2.fromScale(0.95, -0.03),
				AnchorPoint = Vector2.new(0.2, 0.1),
				[event("Activated")] = function(...)
					showUI:set(not true)
				end,
			}),
		},
	})
end

function module.studStyle(self: any) end

return module
