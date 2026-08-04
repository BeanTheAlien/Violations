local util = {}
function util.Mesh(name: string, id: string, pos: Vector3?, size: Vector3?, anchor: boolean?, parent: Instance?)
    local m = Instance.new("MeshPart")
    m.Name = name
    m.MeshId = id
    m.Position = pos or Vector3.new(0, 0, 0)
    m.Size = size or Vector3.new(1, 1, 1)
    m.Anchored = anchor or false
    m.Parent = parent or game.Workspace
end
return util