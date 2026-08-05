local Plr = game:GetService("Players")
local DS = game:GetService("DataStoreService")
local pd = DS:GetDataStore("PD")
local function setPlr(p: Player, c: number, l: number)
    p:SetAttribute("coin", c)
    p:SetAttribute("lvl", l)
end
Plr.PlayerAdded:Connect(function(a0: Player)
    print(a0.Name, "connecting")
    local success, data = pcall(function()
        return pd:GetAsync(a0.UserId)
    end)
    if success and data then
        setPlr(a0, data.coin or 0, data.lvl or 1)
    else
        setPlr(a0, 0, 1)
    end
end)
Plr.PlayerRemoving:Connect(function(a0: Player)
    print(a0.Name, "disconnecting")
    local data = {
        coin = a0:GetAttribute("coin") or 0,
        lvl = a0:GetAttribute("lvl") or 1
    }
    local success, err = pcall(function()
        pd:SetAsync(a0.UserId, data)
    end)
    if not success then
        warn("Failed save", a0.Name, err)
    end
end)