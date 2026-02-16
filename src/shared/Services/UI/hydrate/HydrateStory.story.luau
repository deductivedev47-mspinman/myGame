local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HydrateClient = require(script.Parent.HydrateClient)
local Fusion = require(ReplicatedStorage.Packages.Fusion)
local Ui_Labs = require(ReplicatedStorage.Packages["Ui-Labs"])
local CreateFusionStory = Ui_Labs.CreateFusionStory

local story = CreateFusionStory({
	--parameter
	fusion = Fusion,
}, function(props)
	--ui
	local ui = HydrateClient.init(props.target) --make sure its a frame, its not screengui, UILabs automatically have screenGui On it

	return function()
		ui:Destroy()
	end
end)

return story
