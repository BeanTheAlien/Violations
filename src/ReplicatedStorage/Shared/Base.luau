local Base = {}
Base.__index = Base
export type Base = {
    name: string
}
function Base.new(name: string): Base
    local this = setmetatable({}, Base)
    this.name = name
    return this
end
return Base