const fs = require("fs");
const [,, name, extend = "Base", props = "{\n\t--\n}", argList = "name: string"] = process.argv;
fs.writeFileSync(`src\\ReplicatedStorage\\Modules\\Shared\\${name}.luau`, `local ${extend} = require(script.Parent.${extend})
local ${name} = {}
${name}.__index = ${name}
setmetatable(${name}, ${extend})
export type ${name} = ${extend}.${extend} & ${props.split("\\n").join("\n")}
function ${name}.new(${argList}): ${name}
    local this = setmetatable(${extend}.new(${argList.split(",").map(x => x.trim()).map(x => x.split(":")[0]).join(", ")}), ${name})
    return this
end
return ${name}`);