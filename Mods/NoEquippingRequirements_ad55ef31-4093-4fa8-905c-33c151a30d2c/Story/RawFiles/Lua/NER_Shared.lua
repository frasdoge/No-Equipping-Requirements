-- local function dump(o)
--     if type(o) == 'table' then
--        local s = '{ '
--        for k,v in pairs(o) do
--           if type(k) ~= 'number' then k = '"'..k..'"' end
--           s = s .. '['..k..'] = ' .. dump(v) .. ','
--        end
--        return s .. '} '
--     else
--        return tostring(o)
--     end
-- end

local function OverrideRequirements(things)

    for _, thing in pairs(Ext.GetStatEntries(things)) do

        local reqs = Ext.StatGetAttribute(thing, "Requirements")
        -- Ext.Print(dump(reqs))

        if (next(reqs) ~= nil) then

            for k, _ in pairs(reqs) do
                reqs[k].Param = 0
            end

            Ext.StatSetAttribute(thing, "Requirements", reqs)
            -- Ext.Print(dump(reqs))

        end

    end

end

local function RemoveRequirements(things)

    for _, thing in pairs(Ext.GetStatEntries(things)) do
        Ext.StatSetAttribute(thing, "Requirements", {})
    end

end

local function OverrideStats()
    
    OverrideRequirements("Weapon")
    RemoveRequirements("Shield")
    RemoveRequirements("Armor")

end

Ext.RegisterListener("StatsLoaded", OverrideStats)