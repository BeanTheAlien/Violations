local Loot = require(script.Parent.Loot)
local Util = require(script.Parent.Parent.Util)
local Diamond = {}
Diamond.__index = Diamond
setmetatable(Diamond, Loot)
export type Diamond = Loot.Loot & {
	--
}
function Diamond.new(name: string): Diamond
    local this = setmetatable(Loot.new(name, 15, Util.Mesh("Diamond", "0")), Diamond)
    return this
end
return Diamond