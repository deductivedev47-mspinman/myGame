local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Utils = require(ReplicatedStorage.Shared.services.Utils.Utils)
local ids = Utils().ids
local holdingId = ids.Holding
local names = Utils().Names

type TYPES = {
	SixSeven: any,
}

local mo = {}

function mo.security(): TYPES
	return {
		SixSeven = {},
	}
end

function mo.init()
	Players.PlayerAdded:Connect(function(player)
		player.CharacterAdded:Connect(function(char)
			local animator = char:WaitForChild("Humanoid"):WaitForChild("Animator")
			local track

			char.ChildAdded:Connect(function(child)
				if child:IsA("Tool") and table.find(names.ToolName1, child.Name) then
					local anim = Instance.new("Animation")
					anim.AnimationId = "rbxassetid://" .. holdingId

					child.Equipped:Connect(function()
						track = animator:LoadAnimation(anim)
						child.GripPos = Vector3.new(-2.7, 0, 0)
						track:Play()
					end)

					child.Unequipped:Connect(function()
						if track then
							track:Stop()
						end
					end)
				end
			end)
		end)
	end)
end

return mo
