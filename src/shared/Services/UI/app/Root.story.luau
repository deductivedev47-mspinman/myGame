local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RootUI = require(script.Parent.RootUI)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement

return function(Parent)
	local Root = ReactRoblox.createRoot(Parent)
	local app = e(RootUI)
	Root:render(app)

	return function()
		Root:unmount()
	end
end
