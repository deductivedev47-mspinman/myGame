local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement
local player = Players.LocalPlayer
local playergui = player.PlayerGui
local bun_1 = workspace.Spawns.Buns:FindFirstChild("Part1")
local bun_2 = workspace.Spawns.Buns:FindFirstChild("Part2")
local bun_3 = workspace.Spawns.Buns:FindFirstChild("Part3")
local part2 = workspace:WaitForChild("Part2")
local part = workspace:WaitForChild("Part")
local bool2 = false
local bool = false

local SpawnPoint = workspace.Spawns:WaitForChild("Spawn")

local container = Instance.new("ScreenGui")
container.Parent = playergui
container.ResetOnSpawn = false
container.Name = "UI"

local transportation = {}

function transportation.Teleport(self: BasePart)
	local Position = self.Position

	task.spawn(function()
		for _, player in ipairs(Players:GetPlayers()) do
			local char = player.Character
			char:MoveTo(Position)
		end
	end)
end

function transportation.Generate()
	--variables here
	local root = ReactRoblox.createRoot(container)

	task.spawn(function()
		local function T_T()
			local raw, setraw = React.useState(true)

			React.useEffect(function()
				while raw do
					setraw(false)
					print("squash")
				end
			end, {})

			return e("TextLabel", {
				Visible = false,
				Text = "Ticket",
				Name = "T_T",
			})
		end

		root:render(e(T_T))
	end)
end

local UI = playergui:WaitForChild("UI")

function transportation.Delete(self)
	task.spawn(function()
		if self.Parent == player.Character then
			local UI = playergui:FindFirstChild("UI")
			if not UI then
				return
			end

			local label = UI:FindFirstChild("T_T")
			if not label then
				return
			end

			label:Destroy()
		end

		function transportation.DeleteAll()
			local label2 = UI:FindFirstChild("T_T")
			if not label2 then
				return
			end
			if label2 then
				label2:destroy()
			end
		end
	end)
end

function transportation.Touched(self, part: BasePart)
	--variables here
	task.spawn(function() end)
end

function transportation.init()
	--variables here
	task.spawn(function()
		transportation.Generate()
	end)
end

part.Touched:Connect(function(self)
	if not bool then
		transportation.Generate()
		bool = true

		task.delay(10, function()
			bool = false
		end)
	end
end)

part2.Touched:Connect(function(self)
	if not bool2 then
		bool2 = true
		if self.Parent == player.Character then
			local UI = playergui:FindFirstChild("UI")
			if not UI then
				return
			end

			local label = UI:FindFirstChild("T_T")

			if label then
				transportation.Delete(self)
			else
				print("you don't have T_T")
			end
		end

		task.delay(10, function()
			bool2 = false
			transportation.Teleport(SpawnPoint)
		end)
	end
end)

return transportation
