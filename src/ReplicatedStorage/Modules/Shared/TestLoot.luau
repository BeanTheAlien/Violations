local Loot = require(script.Parent.Loot)
local TestLoot = {}
TestLoot.__index = TestLoot
setmetatable(TestLoot, Loot)
export type TestLoot = Loot.Loot & {
    --
}
function TestLoot.new(name: string): TestLoot
    local this = setmetatable(Loot.new(name), TestLoot)
    return this
end
return TestLoot