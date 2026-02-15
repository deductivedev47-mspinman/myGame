local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.Fusion)
local Ui_Labs = require(ReplicatedStorage.Packages["Ui-Labs"])
local scope = Fusion.scoped(Fusion)

local CreateFusionStory = Ui_Labs.CreateFusionStory

local controls = { ... }

local story = CreateFusionStory({
	fusion = Fusion,
	controls = controls,
}, function(props)
	local component = scope:New("Frame")({
		Parent = props.target,
		Size = UDim2.fromScale(0.3, 0.5),
		Position = UDim2.fromScale(0.5, 0.3),
		AnchorPoint = Vector2.new(0.5, 0.3),
	})

	return function()
		component:Destroy()
	end
end)

return story
