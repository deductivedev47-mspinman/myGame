local ReplicatedStorage = game:GetService("ReplicatedStorage")
local boto: RemoteEvent = ReplicatedStorage:WaitForChild("Boto")
local module = {}

function module.Shop(self)
	local part = workspace:WaitForChild("Prompt")
	local prompt = part:WaitForChild("AtomPrompt")

	prompt.Triggered:Connect(function()
		boto:FireClient(self)
	end)
end

return module
