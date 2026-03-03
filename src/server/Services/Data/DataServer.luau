local Datas = require(script.Parent.Datas)
local plrDatas = Datas().Datas.PlayerData
local data = {}

function data.init()
	table.insert(plrDatas, "Madam")
	task.wait(5)
	print(plrDatas)
end

return data
