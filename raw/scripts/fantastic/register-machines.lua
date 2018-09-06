local buildingHacks=require('plugins.building-hacks')

local buildmenu = dfhack.script_environment("modtools/change-build-menu")

local powerAPI = dfhack.script_environment("modtools/power")

mat_info=mat_info or {}

local function register_mat_info(mat)
    local newMatInfo={}
    --all values assume 1.8m radius cylinder, .1 meters thick
    --kilograms
    newMatInfo.flywheel_mass=mat.material.solid_density*0.1 
    --kg*m^2, 0.5*mass*radius^2
    newMatInfo.moment_of_inertia=newMatInfo.flywheel_mass*1.62 
    --newton-meters, shear yield/polar modulus
    newMatInfo.max_torque=(mat.material.strength.yield.SHEAR/((math.pi/16)*(5.832)))/1000
     --rads/second, ultimate tensile strength/density*radius^2
    newMatInfo.max_speed=math.sqrt(mat.material.strength.fracture.YIELD/(mat.material.solid_density*3.24))
    --joules
    newMatInfo.max_energy=0.5*newMatInfo.moment_of_inertia*newMatInfo.max_speed^2
    mat_info[mat]=newMatInfo
end

local function flywheel_action(workshop)
    local mat=dfhack.matinfo.decode(workshop.mat_type,workshop.mat_index)
    if not mat_info[mat] then
        register_mat_info(mat)
    end
    local properMatInfo=mat_info[mat]
    local machine=df.machine.find(workshop.machine.machine_id)
    local ourPowerProduced,ourPowerConsumed=buildingHacks.getPower(workshop)
    local total_power=machine.cur_power-ourPowerProduced
    local total_consumption=machine.min_power-ourPowerConsumed
    local our_energy=powerAPI.get_building_power(workshop)
    local powerSurplus=total_power-total_consumption
    local powerGained=math.max(-properMatInfo.max_torque,math.min(powerSurplus,properMatInfo.max_torque))
    our_energy.anon_1=math.min(properMatInfo.max_energy,our_energy.anon_1+powerGained)
    if our_energy.anon_1>0 then
        buildingHacks.setPower(workshop,math.min(properMatInfo.max_torque,our_energy.anon_1),math.max(1,powerGained))
    else
        buildingHacks.setPower(workshop,0,1)
    end
end

buildingHacks.registerBuilding{name='FLYWHEEL_EW',
    action={1,flywheel_action},
    auto_gears=true,
}

buildingHacks.registerBuilding{name='FLYWHEEL_NS',
    action={1,flywheel_action},
    auto_gears=true,
}

buildmenu.ChangeBuilding('FLYWHEEL_NS','MACHINES',true)

buildmenu.ChangeBuilding('FLYWHEEL_EW','MACHINES',true)

local eventful=require('plugins.eventful')

local guidm=require('gui.dwarfmode')

local widgets=require('gui.widgets')

eventful.onWorkshopFillSidebarMenu=function(workshop,callnative)
    local building_type=df.building_def_workshopst.find(workshop.custom_type)
    local building_id=building_type and building_type.code or false
    if building_id then
        if building_id == 'FLYWHEEL_EW' or building_id == 'FLYWHEEL_NS' then
            local overlay=guidm.WorkshopOverlay{workshop=workshop}
            local machine=df.machine.find(workshop.machine.machine_id)
            local active_label=widgets.Label{view_id='activity'}
            local is_active=machine.cur_power>=machine.min_power
            local our_energy=powerAPI.get_building_power(workshop)
            active_label:setText(is_active and {text='Active',pen={bg=COLOR_BLACK,fg=COLOR_LIGHTGREEN}} or {text='Inactive',pen={bg=COLOR_BLACK,fg=COLOR_LIGHTRED}})
            overlay:addviews({
                active_label,
                widgets.Label{
                    view_id='cur_power',
                    text='Total Power: '..machine.cur_power
                },
                widgets.Label{
                    view_id='min_power',
                    text='Total Power Needed: '..machine.min_power
                },
                widgets.Label{
                    view_id='energy',
                    text='Energy stored: '..our_energy.anon_1
                }
            })
            callnative.value=false
            overlay:show()
        elseif building_id.find('POWERED_FURNACE_') then
            local overlay=guidm.WorkshopOverlay{workshop=workshop}
            local machine=df.machine.find(workshop.machine.machine_id)
            local active_label=widgets.Label{view_id='activity'}
            local is_active=machine.cur_power>=machine.min_power
            local our_energy=powerAPI.get_building_power(workshop)
            active_label:setText(is_active and {text='Active',pen={bg=COLOR_BLACK,fg=COLOR_LIGHTGREEN}} or {text='Inactive',pen={bg=COLOR_BLACK,fg=COLOR_LIGHTRED}})
            overlay:addviews({
                active_label,
                widgets.Label{
                    view_id='cur_power',
                    text='Total Power: '..machine.cur_power
                },
                widgets.Label{
                    view_id='min_power',
                    text='Total Power Needed: '..machine.min_power
                },
                widgets.Label{
                    view_id='energy',
                    text='Energy remaining: '..our_energy.anon_1
                }
            })
            callnative.value=false
            overlay:show()
        end
    end
end

local function furnace_action(workshop)
    local machine=df.machine.find(workshop.machine.machine_id)
    local our_energy=powerAPI.get_building_power(workshop)
    buildingHacks.setPower(workshop,0,our_energy.anon_1>0 and math.min(1000,our_energy.anon_1) or 5)
    local _,consumed=buildingHacks.getPower(workshop)
    our_energy.anon_1=math.max(0,our_energy.anon_1-math.min(machine.max_power,consumed))
end

eventful.onReactionComplete.powered_furnace=function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    local buildingRaw=df.building_def.find(reaction.building.custom[0])
    if buildingRaw and buildingRaw.code:find('POWERED_FURNACE_') then
        local workshop=dfhack.buildings.findAtTile(unit.pos)
        for k,v in ipairs(input_reagents) do
            if buildingRaw.code:find('power/') then 
                local our_energy=powerAPI.get_building_power(workshop)
                our_energy.anon_1=tonumber(buildingRaw.code:sub(1+buildingRaw.code:find('/.*')))
            end
        end
    end
end


buildingHacks.registerBuilding{name='POWERED_FURNACE_ELECTROWINNING',
    action={1,furnace_action},
    auto_gears=true
}

local prayerWheelSyndrome=false

local function getPrayerWheelSyndrome()
    if prayerWheelSyndrome then
        return prayerWheelSyndrome
    else
        for k,syn in ipairs(df.global.world.raws.syndromes.all) do
            if syn.syn_name=="the spinning of a prayer wheel" then
                prayerWheelSyndrome=syn
                return prayerWheelSyndrome
            end
        end
    end
end

local function shouldBePrayered(unit)
    if not unit or not unit.status or not unit.status.current_soul then return false end
    getPrayerWheelSyndrome()
    for k,v in ipairs(unit.status.current_soul.personality.emotions) do
        if v.thought==df.unit_thought_type.Syndrome and v.subthought==prayerWheelSyndrome.id then return false end
    end
    return true
end

local function prayer_wheel_action(workshop)
    local units=dfhack.getUnitsInBox(workshop.x1-3,workshop.y1-3,workshop.x2+3,workshop.x2+3,workshop.z,workshop.z,shouldBePrayered)
    for _,unit in ipairs(units) do
        dfhack.run_script('add-thought','-unit',unit.id,'-thought','the spinning of a prayer wheel','-emotion','CONTENTMENT','-severity',100,'-strength',50)
        for _,need in ipairs(unit.status.current_soul.personality.needs) do
            if need.id==df.PrayOrMedidate then
                need.focus_level=math.min(400,need.focus_level+100)
            end
        end
    end
end

buildingHacks.registerBuilding{name='PRAYER_WHEEL',
    action={1,prayer_wheel_action},
    consume=1,
    gears={x=1,y=1},
    canBeRoomSubset=true,
    }