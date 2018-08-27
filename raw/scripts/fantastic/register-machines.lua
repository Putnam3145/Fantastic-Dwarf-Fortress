local buildingHacks=require('plugins.building-hacks')

mat_info=mat_info or {}

local function register_mat_info(mat)
    local newMatInfo={}
    --all values assume 1.8m radius cylinder, .1 meters thick
    --kilograms
    newMatInfo.flywheel_mass=mat.material.solid_density*0.1 
    --kg*m^2, 1/2(mr^2)
    newMatInfo.moment_of_inertia=newMatInfo.flywheel_mass*1.62 
    --newton-meters, shear yield/polar modulus
    newMatInfo.max_torque=(mat.material.strength.yield.SHEAR/((math.pi/16)*(5.832)))/1000
     --rads/second
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
    local ourPowerProduced=buildingHacks.getPower(workshop)
    local total_power=machine.cur_power-ourPowerProduced
    local total_consumption=machine.min_power
    local our_energy=dfhack.buildings.getGeneralRef(workshop,df.general_ref_type.LANGUAGE)
    if not our_energy then
        local energy=df.general_ref_languagest:new()
        energy.anon_1=0
        workshop.general_refs:insert(energy)
        our_energy=energy
    end
    local powerSurplus=total_power-total_consumption
    local powerGained=math.max(-properMatInfo.max_torque,math.min(powerSurplus,properMatInfo.max_torque))
    our_energy.anon_1=math.min(properMatInfo.mag_energy,our_energy.anon_1+powerGained)
    if our_energy.anon_1>0 then
        buildingHacks.setPower(workshop,math.max(0,-powerSurplus),1)
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

local eventful=require('plugins.eventful')

local guidm=require('gui.dwarfmode')

local widgets=require('gui.widgets')

local FlywheelView=defclass(FlywheelView,)

eventful.onWorkshopFillSidebarMenu=function(workshop,callnative)
    local building_id=df.building_def_workshopst.find(workshop.custom_type)
    if building_id and building_id == 'FLYWHEEL_EW' or building_id == 'FLYWHEEL_NS' then
        local overlay=guidm.WorkshopOverlay{workshop=workshop}
        local machine=df.machine.find(workshop.machine.machine_id)
        local active_label=widgets.Label{view_id='activity'}
        local is_active=machine.cur_power>=machine.min_power
        local our_energy=dfhack.buildings.getGeneralRef(workshop,df.general_ref_type.LANGUAGE)
        if not our_energy then
            local energy=df.general_ref_languagest:new()
            energy.anon_1=0
            workshop.general_refs:insert(energy)
            our_energy=energy
        end
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
    end
end