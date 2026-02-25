-- local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- local React = require(ReplicatedStorage.Packages.React)
-- local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
-- local Mount = require(script.Parent.Mount)
-- local e = React.createElement

-- return function(parent)
-- 	local root = ReactRoblox.createRoot(parent)

-- 	local app = e(React.Fragment, nil, { Mount() })

-- 	root:render(app)

-- 	return function()
-- 		root:unmount()
-- 	end
-- end
