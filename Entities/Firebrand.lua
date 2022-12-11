--Buggy :( 
local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/CometV4/main/Misc/CustomCreator.lua"))()

    local entity = Creator.createEntity({
        Model = "https://github.com/fnaclol/sussy-bois/raw/main/FireBrand3.rbxm",
        Speed = 400,
        DelayTime = 2,
        HeightOffset = 0,
        CanKill = true,
        BreakLights = true,
        FlickerLights = {
            true,
            1,
        },
        Cycles = {
            Min = 2,
            Max = 2,
            WaitTime = 2,
        },
        CamShake = {
            true,
            {5, 15, 0.1, 1},
            100,
        },
        CustomDialog = {"You died to whom you call FireBrand", "He will spawn only on your will.", "When you hear him spawn you only have 2 seconds to hide", "Vents do not save you!", "Best of luck!"}
    })

    Creator.runEntity(entity)
end
