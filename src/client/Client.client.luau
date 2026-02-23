local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local ScreenUI = require(ReplicatedStorage.Shared.Services.UI.ScreenUI)
ScreenUI.react()

local UserInputService = game:GetService("UserInputService")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)

local function MyInputScript()
	local canPrint, setCanPrint = React.useState(true)

	React.useEffect(function()
		-- STEP 1: Start the 20s timer
		task.delay(20, function()
			setCanPrint(false)
		end)

		-- STEP 2: Setup the input listener
		local connection = UserInputService.InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.F then
				-- STEP 3: The simple logic
				if canPrint == true then
					print("You pressed F! This works for now.")
				else
					print("20 seconds are up. Stop spamming!")
				end
			end
		end)

		-- STEP 4: Clean up (Important!)
		return function()
			connection:Disconnect()
		end
	end, { canPrint }) -- This ensures the function sees the updated 'canPrint' value

	return nil
end

-- HOW TO FIRE IT:
-- You mount it to your PlayerGui like this:
local root = ReactRoblox.createRoot(Instance.new("Folder", player.PlayerGui))
root:render(React.createElement(MyInputScript))
