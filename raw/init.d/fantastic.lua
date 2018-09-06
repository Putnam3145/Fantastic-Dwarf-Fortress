local thought_funcs={}

local function unitWasProbablyInvader(unit)
    return unit.flags1.marauder or unit.flags1.active_invader or unit.flags1.invader_origin or unit.flags1.hidden_ambusher or unit.flags1.invades
end

thought_funcs['SawDeadBody']=function(unit,emotion)
    if df.emotion_type.attrs[emotion.type].divider<=0 then return false end
    local incident=df.incident.find(emotion.subthought)
    local deadUnit=df.unit.find(incident.victim)
    if dfhack.units.isCitizen(unit) and incident.conflict_level>2 and unitWasProbablyInvader(deadUnit) then
        dfhack.run_script('add-thought','-unit',unit.id,'-thought','SawDeadBody','-emotion','ACCEPTANCE','-strength',emotion.strength,'-severity',emotion.severity)
    end
end

thought_funcs['WitnessDeath']=function(unit,emotion)
    if df.emotion_type.attrs[emotion.type].divider<=0 then return false end
    local incident=df.incident.find(emotion.subthought)
    local deadUnit=df.unit.find(incident.victim)
    if dfhack.units.isCitizen(unit) and incident.conflict_level>2 and unitWasProbablyInvader(deadUnit) then
        dfhack.run_script('add-thought','-unit',unit.id,'-thought','WitnessDeath','-emotion','RELIEF','-strength',emotion.strength,'-severity',emotion.severity)
    end
end

dfhack.script_environment('modtools/putnam_events').onEmotion.fantastic=function(unit,emotion)
    local thought=df.unit_thought_type[emotion.thought]
    if thought_funcs[thought] then
        thought_funcs[thought](unit,emotion)
    end
end

local stateEvents={}

stateEvents[SC_WORLD_LOADED]=function() 
    dfhack.run_command('script',SAVE_PATH..'/raw/fantastic_onload.txt')
    local putnamEvents=dfhack.script_environment('modtools/putnam_events')
    putnamEvents.enableEvent(putnamEvents.eventTypes.ON_EMOTION)
end

function onStateChange(op)
    local stateChangeFunc=stateEvents[op]
    if stateChangeFunc then stateChangeFunc() end
end