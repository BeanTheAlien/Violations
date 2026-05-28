const fs = require("fs");
const [,, name, extend = "Base"] = process.argv;
fs.writeFileSync(`src\\ReplicatedStorage\\Modules\\Shared\\${name}.luau`, `local ${extend} = require(script.Parent.${extend})
local ${name} = {}
${name}.__index = ${name}
setmetatable(${name}, ${extend})
export type ${name} = ${extend}.${extend} & {
    --
}
function ${name}.new(name: string): ${name}
    local this = setmetatable(${extend}.new(name), ${name})
    return this
end
return ${name}`);