--@ module = true
--@ enable = true

local buildingHacks=require('plugins.building-hacks')

function get_building_power(workshop)
    local our_energy=dfhack.buildings.getGeneralRef(workshop,df.general_ref_type.LANGUAGE)
    if not our_energy then
        local energy=df.general_ref_languagest:new()
        energy.anon_1=0
        workshop.general_refs:insert(energy)
        our_energy=energy
    end
    return our_energy
end