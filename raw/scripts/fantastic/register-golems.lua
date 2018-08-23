local eventful=require("plugins.eventful")

eventful.removeNative('GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_HIGH_SPEED_STEEL_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','HIGH_SPEED_STEEL_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_HIGH_SPEED_STEEL_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_IRON_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','IRON','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_IRON_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_GOLD_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','GOLD','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_GOLD_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_SILVER_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','SILVER','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_SILVER_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_COPPER_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','COPPER','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_COPPER_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_NICKEL_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','NICKEL','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_NICKEL_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_ZINC_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','ZINC','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_ZINC_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_BRONZE_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','BRONZE','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_BRONZE_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_BRASS_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','BRASS','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_BRASS_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_STEEL_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','STEEL','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_STEEL_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_PLATINUM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','PLATINUM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_PLATINUM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_ELECTRUM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','ELECTRUM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_ELECTRUM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_TIN_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','TIN','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_TIN_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_PEWTER_FINE_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','PEWTER_FINE','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_PEWTER_FINE_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_PEWTER_TRIFLE_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','PEWTER_TRIFLE','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_PEWTER_TRIFLE_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_PEWTER_LAY_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','PEWTER_LAY','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_PEWTER_LAY_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_LEAD_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','LEAD','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_LEAD_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_ALUMINUM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','ALUMINUM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_ALUMINUM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_NICKEL_SILVER_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','NICKEL_SILVER','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_NICKEL_SILVER_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_BILLON_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','BILLON','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_BILLON_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_STERLING_SILVER_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','STERLING_SILVER','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_STERLING_SILVER_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_BLACK_BRONZE_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','BLACK_BRONZE','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_BLACK_BRONZE_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_ROSE_GOLD_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','ROSE_GOLD','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_ROSE_GOLD_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_BISMUTH_BRONZE_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','BISMUTH_BRONZE','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_BISMUTH_BRONZE_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_ADAMANTINE_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','ADAMANTINE','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_ADAMANTINE_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_BERYLLIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','BERYLLIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_BERYLLIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_SCANDIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','SCANDIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_SCANDIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_TITANIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','TITANIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_TITANIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_CHROMIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','CHROMIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_CHROMIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_MANGANESE_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','MANGANESE_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_MANGANESE_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_YTTRIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','YTTRIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_YTTRIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_ZIRCONIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','ZIRCONIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_ZIRCONIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_MOLYBDENUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','MOLYBDENUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_MOLYBDENUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_TUNGSTEN_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','TUNGSTEN_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_TUNGSTEN_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_PRASEODYMIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','PRASEODYMIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_PRASEODYMIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_NEODYMIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','NEODYMIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_NEODYMIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_SAMARIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','SAMARIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_SAMARIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_GADOLINIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','GADOLINIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_GADOLINIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_TERBIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','TERBIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_TERBIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_DYSPROSIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','DYSPROSIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_DYSPROSIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_HOLMIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','HOLMIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_HOLMIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_ERBIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','ERBIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_ERBIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_THULIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','THULIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_THULIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')

eventful.registerReaction('LUA_HOOK_GOLEM_LUTETIUM_PUTNAM_FANTASTIC',function(reaction,reaction_product,unit,input_items,input_reagents,output_items,call_native)
    call_native.value=false
    dfhack.run_script('modtools/create-unit','-race','FANTASTIC_GOLEM','-caste','LUTETIUM_PUTNAM','-domesticate','-setUnitToFort','-age','0','-name','CLOSE_DIVINE_FANTASTIC','-location','[',unit.pos.x-1,unit.pox.y,unit.pos.z,']')
end)
eventful.addReactionToShop('LUA_HOOK_GOLEM_LUTETIUM_PUTNAM_FANTASTIC','GOLEM_BUILDING_WORKSHOP')