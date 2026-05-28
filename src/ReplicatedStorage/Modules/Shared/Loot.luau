local Base = require(script.Parent.Base)
local Loot = {}
Loot.__index = Loot
setmetatable(Loot, Base)
export type Loot = Base.Base & {
	val: number,
mesh: MeshPart
}
function Loot.new(name: string, val: number, mesh: MeshPart): Loot
    local this = setmetatable(Base.new(name), Loot)
    this.val = val
	this.mesh = mesh
    return this
end
return Loot