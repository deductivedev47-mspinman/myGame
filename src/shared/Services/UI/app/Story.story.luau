local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Props = require(script.Parent.Props)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement

return function(parent)
	local root = ReactRoblox.createRoot(parent)
	root:render(e(Props.init))

	return function()
		root:unmount()
	end
end
