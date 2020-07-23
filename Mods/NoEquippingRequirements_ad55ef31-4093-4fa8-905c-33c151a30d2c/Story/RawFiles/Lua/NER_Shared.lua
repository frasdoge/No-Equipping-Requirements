local function OverrideRequirements(things)

    for _, thing in pairs(Ext.GetStatEntries(things)) do

        local reqs = Ext.StatGetAttribute(thing, "Requirements")

        if (next(reqs) ~= nil) then
            for k, _ in pairs(reqs) do
                if reqs[k].Requirement ~= "Tag" then
                    reqs[k].Param = 0
                else
                    reqs[k] = nil
                end
            end

            Ext.StatSetAttribute(thing, "Requirements", reqs)
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