local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)
local scope = Fusion.scoped(Fusion)
local c = scope.Children

local module = {}

function module.init()
	scope:New("ScreenGui")({
		Name = "N Guis",
		Parent = Players.LocalPlayer:WaitForChild("PlayerGui"),
		[c] = {
			scope:New("Frame")({
				Position = UDim2.fromScale(0.5, 0.3),
				AnchorPoint = Vector2.new(0.5, 0.3),
				Size = UDim2.fromScale(0.38, 0.5),

				[c] = {
					scope:New("TextButton")({
						Text = "X",
						AutoButtonColor = true,
						TextColor3 = Color3.fromRGB(0, 0, 0),
						BackgroundColor3 = Color3.fromRGB(201, 0, 0),
						Size = UDim2.fromScale(0.08, 0.1),
						Position = UDim2.fromScale(0.95, -0.03),
						AnchorPoint = Vector2.new(0.2, 0.1),
					}),
				},
			}),
		},
	})
end

return module
