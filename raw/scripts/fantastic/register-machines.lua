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
    
end

buildingHacks.registerBuilding{name='FLYWHEEL_EW',
    action={1,flywheel_action},

    }