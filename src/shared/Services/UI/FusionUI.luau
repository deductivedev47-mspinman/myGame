local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local scope = Fusion.scoped(Fusion)
local c = Fusion.Children

local goal = scope:Value(0)
local animated = scope:Spring(goal)

local mo = {}

function mo.init(self: any)
	scope:New("TextButton")({
		Text = "Shop",
		Parent = self,
		Size = UDim2.fromScale(0.2, 0.3),
		Position = UDim2.fromScale(0.5, 0.3),
		AnchorPoint = UDim2.fromScale(0.5, 0.4),

		[c] = {
			scope:New("UIStroke")({
				Thickness = 6,
			}),
		},
	})
end

return mo
