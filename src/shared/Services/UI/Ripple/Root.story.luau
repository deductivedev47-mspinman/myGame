local RMount = require(script.Parent.RMount)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local e = React.createElement

return function(parent)
	local root = ReactRoblox.createRoot(parent)

	local app = e(React.Fragment, nil, { RMount.UI() })

	root:render(app)

	return function()
		root:unmount()
	end
end
