local Base = require(script.Parent.Parent.Base)
local Bad = {}
Bad.__index = Bad
setmetatable(Bad, Base)
export type Bad = Base.Base & {
    --
}
function Bad.new(name: string): Bad
    local this = setmetatable(Base.new(name), Bad)
    return this
end
return Bad