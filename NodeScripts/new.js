const fs = require("fs");
const [,, name, extend = "Base", props = "{\n\t--\n}", argListGeneric = null, useOnlyName = "false"] = process.argv;
const argList = "name: string" + (argListGeneric != null ? ", " + argListGeneric : "");
const argProp = argList.split(",").map(x => x.trim()).map(x => x.split(":")[0]);
fs.writeFileSync(`src\\ReplicatedStorage\\Modules\\Shared\\${name}.luau`, `local ${extend} = require(script.Parent.${extend})
local ${name} = {}
${name}.__index = ${name}
setmetatable(${name}, ${extend})
export type ${name} = ${extend}.${extend} & ${props.replaceAll("\\n", "\n").replaceAll("\\t", "\t")}
function ${name}.new(${argList}): ${name}
    local this = setmetatable(${extend}.new(${!Boolean(useOnlyName) ? argProp.join(", ") : "name"}), ${name})
    ${argProp.length == 1 ? "" : argProp.slice(1).map(x => `this.${x} = ${x}`).join("\n\t")}
    return this
end
return ${name}`);