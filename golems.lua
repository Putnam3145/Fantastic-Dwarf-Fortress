local golem_string=[[
    [CASTE:MATERIAL_ID]
        [TISSUE:MATERIAL_ID]
            [TISSUE_NAME:mat name:NP]
            [TISSUE_MATERIAL:INORGANIC:MATERIAL_ID]
            [MUSCULAR]
            [FUNCTIONAL]
            [STRUCTURAL]
            [RELATIVE_THICKNESS:1]
            [CONNECTS]
            [TISSUE_SHAPE:LAYER]
    	[TISSUE_LAYER:BY_CATEGORY:ALL:MATERIAL_ID]
        [ITEMCORPSE:STATUE:NO_SUBTYPE:INORGANIC:MATERIAL_ID]
        [ITEMCORPSE_QUALITY:2]
]]

local basic_mil=[[
        [NATURAL_SKILL:GRASP_STRIKE:5]
        [NATURAL_SKILL:STANCE_STRIKE:5]
        [NATURAL_SKILL:WRESTLING:5]
        [NATURAL_SKILL:MELEE_COMBAT:5]
        [NATURAL_SKILL:DODGING:5]
        [TRAINABLE_WAR]
        [CREATURE_CLASS:GOLEM_MILITARY]
]]

local better_mil=[[
        [NATURAL_SKILL:GRASP_STRIKE:10]
        [NATURAL_SKILL:STANCE_STRIKE:10]
        [NATURAL_SKILL:WRESTLING:10]
        [NATURAL_SKILL:MELEE_COMBAT:10]
        [NATURAL_SKILL:DODGING:10]
        [TRAINABLE_WAR]
        [CREATURE_CLASS:GOLEM_MILITARY]
]]

local basic_labor=[[
        [CREATURE_CLASS:GOLEM_LABOR]
        [CAN_LEARN]
        [SKILL_LEARN_RATES:0]
]]

local better_labor=[[
        [CREATURE_CLASS:GOLEM_LABOR]
        [CAN_LEARN]
        [SKILL_LEARN_RATES:50]
]]

local fully_sapient=[[
        [CREATURE_CLASS:GOLEM_LABOR]
        [CREATURE_CLASS:GOLEM_MILITARY]
        [CREATURE_CLASS:GOLEM_SAPIENT]
        [EQUIPS]
        [CANOPENDOORS]
        [INTELLIGENT]
]]

local reaction=[[
    [REACTION:LUA_HOOK_GOLEM_MATERIAL_ID_FANTASTIC]
        [NAME:make mat name golem]
        [BUILDING:GOLEM_BUILDING_WORKSHOP:NONE]
        [REAGENT:mat name:1500:BAR:NONE:INORGANIC:MATERIAL_ID]
        [PRODUCT:100:1:BOULDER:NONE:INORGANIC:CLAY]
        [SKILL:ALCHEMY]
        [DESCRIPTION:Create a golem out of mat name.EXTRA_INFO]
        [CATEGORY:GOLEM_TYPE]
]]

local function has_reaction_class(mat,reaction_class)
    for k,v in ipairs(mat.reaction_class) do
        if v.value==reaction_class then return true end
    end
    return false
end

local f1=assert(io.open('golem_caste.txt','w'))

local f2=assert(io.open('golem_reaction.txt','w'))

local f3=assert(io.open('golem_lua.txt','w'))

local sap_desc=[[
            [CATEGORY_NAME:Sapient golems]
            [CATEGORY_DESCRIPTION:Golems with full citizenry.]
]]

local labor_desc=[[
            [CATEGORY_NAME:Labor golems]
            [CATEGORY_DESCRIPTION:Golems who can do basic labors.]
]]

local mil_desc=[[
            [CATEGORY_NAME:Military golems]
            [CATEGORY_DESCRIPTION:Golems who can be used in war.]
]]

--yo, dawg
local spawn_lua_string=[[eventful.registerReaction('LUA_HOOK_GOLEM_MATERIAL_ID_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','MATERIAL_ID','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)

]]

local mil_desc_given=false

local labor_desc_given=false

local sapient_desc_given=false

for k,v in ipairs(df.global.world.raws.inorganics) do
    if v.material.flags.IS_METAL and v.material.flags.ITEMS_HARD and not v.flags.DIVINE then
        local new_caste=string.gsub(golem_string,'MATERIAL_ID',v.id)
        local new_reaction=string.gsub(reaction,'MATERIAL_ID',v.id)
        local reaction_func=string.gsub(spawn_lua_string,'MATERIAL_ID',v.id)
        new_reaction=string.gsub(new_reaction,'mat name',v.material.state_name.Solid)
        new_caste=string.gsub(new_caste,'mat name',v.material.state_name.Solid)
        if v.flags.DEEP_SPECIAL or has_reaction_class(v.material,'GOLEM_SAPIENT') then
            new_caste=new_caste..fully_sapient
            new_reaction=string.gsub(new_reaction,'GOLEM_TYPE','GOLEM_SAPIENT')
            new_reaction=string.gsub(new_reaction,'EXTRA_INFO','')
            if not sapient_desc_given then
                new_reaction=new_reaction..sap_desc
                sapient_desc_given=true
            end
        elseif v.material.flags.ITEMS_WEAPON or has_reaction_class(v.material,'GOLEM_MILITARY') then
            new_reaction=string.gsub(new_reaction,'GOLEM_TYPE','GOLEM_MILITARY')
            if not mil_desc_given then
                new_reaction=new_reaction..labor_desc
                mil_desc_given=true
            end
            if v.material.material_value<25 then
                new_caste=new_caste..basic_mil
                new_reaction=string.gsub(new_reaction,'EXTRA_INFO','')
            else
                new_caste=new_caste..better_mil
                new_reaction=string.gsub(new_reaction,'EXTRA_INFO',' This golem will be especially skilled.')
            end
        else
            new_reaction=string.gsub(new_reaction,'GOLEM_TYPE','GOLEM_LABOR')
            if not labor_desc_given then
                new_reaction=new_reaction..mil_desc
                labor_desc_given=true
            end
            if v.material.material_value<25 then
                new_caste=new_caste..basic_labor
                new_reaction=string.gsub(new_reaction,'EXTRA_INFO','')
            else
                new_caste=new_caste..better_labor
                new_reaction=string.gsub(new_reaction,'EXTRA_INFO',' This golem will be able to learn skills, albeit slowly.')
            end
        end
        f1:write(new_caste)
        f2:write(new_reaction)
        f3:write(reaction_func)
    end
end

f1:close()
f2:close()
f3:close()