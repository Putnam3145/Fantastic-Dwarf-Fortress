local stateEvents={}

stateEvents[SC_MAP_LOADED]=function() 
    dfhack.run_command('script',SAVE_PATH..'/raw/fantastic_onload.txt')
end

function onStateChange(op)
    local stateChangeFunc=stateEvents[op]
    if stateChangeFunc then stateChangeFunc() end
end

