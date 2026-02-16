local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local Fusion = require(ReplicatedStorage.Packages.Fusion)
local UI = StarterGui:WaitForChild("Admin")
local scope = Fusion:scoped()

local fusion = {}

function fusion.init(self: any)
	local frame = scope:Hydrate(UI:WaitForChild("Frame"):Clone())({
		Parent = self,
		Name = "natetheDev",
	})

	--button2

	local kick = frame:WaitForChild("Kick2")

	local button2 = frame:WaitForChild("Kick"):WaitForChild("Button")
	button2.MouseButton1Click:Connect(function()
		kick.Visible = true
	end)

	button2.MouseButton2Click:Connect(function()
		kick.Visible = false
	end)

	--button3
	local button3 = frame:WaitForChild("Message"):WaitForChild("Button")

	local message2 = frame:WaitForChild("Message2")

	button3.MouseButton1Click:Connect(function()
		message2.Visible = true
	end)

	button3.MouseButton2Click:Connect(function()
		message2.Visible = false
	end)
end

return fusion
