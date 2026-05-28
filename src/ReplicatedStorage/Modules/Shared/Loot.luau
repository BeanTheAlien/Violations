local Base = require(script.Parent.Base)
local Loot = {}
Loot.__index = Loot
setmetatable(Loot, Base)
export type Loot = Base.Base & {
    --
}
function Loot.new(name: string): Loot
    local this = setmetatable(Base.new(name), Loot)
    return this
end
return Loot