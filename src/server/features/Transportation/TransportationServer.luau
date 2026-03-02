local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement
local spawns = workspace.Spawns
local spawnPoint = spawns.Spawn
local s_1 = spawns.Buns["1"]
local s_2 = spawns.Buns["2"]
local s_3 = spawns.Buns["3"]

local m = {}

function m.ticket()
	return e("TextLabel", {
		Name = "Ticket",
		Text = "T:I:C:K:E:T",
		Size = UDim2.fromScale(0.001, 0.001),
		Position = UDim2.fromScale(0.5, -100),
		AnchorPoint = Vector2.new(0.5, 0.5),
	})
end

function m.init()
	Players.PlayerAdded:Connect(function(player)
		local plrUI = player.PlayerGui
		local plrID = player.UserId
		local container = Instance.new("ScreenGui")
		container.Name = "TicketUI"
		container.Parent = plrUI
		container.ResetOnSpawn = false
		container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		container.ClipToDeviceSafeArea = false
		container.IgnoreGuiInset = true

		--Function 1
		function m.RootUI(self)
			local root = ReactRoblox.createRoot(container)
			root:render(e(self))
		end

		--Function 2
		function m.generateticket()
			if plrID then
				m.RootUI(m.ticket)
			end
		end

		function m.delete(self)
			self:Destroy()
		end

		m.generateticket()

		local function touched(self: BasePart)
			-- local ticketUI = plrUI:FindFirstChild("TicketUI")
			-- if not ticketUI then
			-- 	return
			-- end
			local ticket = plrUI.TicketUI:FindFirstChild("Ticket")
			if not ticket then
				return
			end
			if self.Name == "Left Leg" then
				if ticket then
					m.delete(ticket)
					print("Checked")
				end
			end
		end

		s_1.Touched:Connect(function(self)
			touched(self)
		end)
		s_2.Touched:Connect(function(self)
			touched(self)
		end)
		s_3.Touched:Connect(function(self)
			touched(self)
		end)
	end)
end

return m
