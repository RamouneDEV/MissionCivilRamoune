
CreateThread(function()
    for _,v in pairs(Config.PositionPedInteraction) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, Config.Blip.Sprite)
        SetBlipColour(blip, Config.Blip.Color)
        SetBlipScale(blip, Config.Blip.ScaleBlip)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING") 
        AddTextComponentString(Config.Blip.BlipName)
        EndTextCommandSetBlipName(blip)
        CreatePedModel()
    end
    while true do
        timer = 750
        local playerCoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Config.PositionPedInteraction) do
            local distance = #(playerCoords - vector3(v.x, v.y, v.z))
            if distance < Config.drawDistance then
                timer = 0
                --DrawMarker(22, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.45, 0.45, 0.45, 255, 0, 0, 255, 55555, false, true, 2, false, false, false, false)
                if distance < Config.itrDistance then
                    ESX.ShowHelpNotification(Config.Notification.ShowHelpNotification)
                    if IsControlJustPressed(0, 51) then
                        Missionmenu()
                    end
                end
            elseif distance > 5.0 and distance < 15.0 then
                timer = 750
            end
        end
        Wait(timer)
    end
end)


function SpawnFinishMission(model)
    local model = GetHashKey(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    local vehicle = CreateVehicle(model, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), true, false)
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
end

function CreatePedModel()
    for k,v in pairs(Config.PositionPedInteraction) do
        local model = GetHashKey(Config.pedModel)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(1)
        end
        local ped = CreatePed(4, model, v.x, v.y, v.z, v.h, false, true)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetEntityInvincible(ped, true)
    end
end

