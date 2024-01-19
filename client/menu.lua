inMission = false
OpenMenu = false
local mainMission = RageUI.CreateMenu("Mission Civile", "Mission Disponibles", 0, 0, nil, nil, 0, 255, 255, 255)

mainMission.Closed = function()
    OpenMenu = false
end


function LoadBlips()
    for k,v in pairs(Config.PosiblesMission) do
        local blipGPS = AddBlipForCoord(v.positionGPS.x, v.positionGPS.y, v.positionGPS.z)
        SetBlipSprite(blipGPS, Config.Blip.SpriteGPS)
        SetBlipColour(blipGPS, Config.Blip.ColorGPS)
        SetBlipScale(blipGPS, Config.Blip.ScaleBlipGPS)
        SetBlipAsShortRange(blipGPS, true)
        SetBlipRoute(blipGPS, true)
        SetBlipAlpha(blipGPS, Config.Blip.BlipAlpha)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Blip.BlipNameGPS)
        EndTextCommandSetBlipName(blipGPS)
    end
end

function Missionmenu()
    if OpenMenu then
        OpenMenu = false
        RageUI.Visible(mainMission, false)
        return
    else
        OpenMenu = true
        RageUI.Visible(mainMission, true)
        CreateThread(function()
            while OpenMenu do
                Wait(1)
                RageUI.IsVisible(mainMission, function()
                    for k,v in pairs(Config.PosiblesMission) do 
                        RageUI.Button(v.label, nil, {RightLabel = "~g~"..v.price.."$~s~ →→"}, not inMission, {
                            onSelected = function()
                                inMission = true
                                ESX.ShowAdvancedNotification(Config.AdvancedNotification.debutMission.title, Config.AdvancedNotification.debutMission.subject, Config.AdvancedNotification.debutMission.msg, Config.AdvancedNotification.debutMission.icon, 1)
                                local model = GetHashKey(v.modelVehicle)
                                RequestModel(model)
                                while not HasModelLoaded(model) do
                                    Wait(1)
                                end
                                local vehicleMission = CreateVehicle(model, v.spawn.x, v.spawn.y, v.spawn.z, v.spawn.h, true, false)
                                TaskWarpPedIntoVehicle(PlayerPedId(), vehicleMission, -1)
                                SetVehicleNumberPlateText(vehicleMission, "MISSION")
                                local blipGPS = AddBlipForCoord(v.positionGPS.x, v.positionGPS.y, v.positionGPS.z)
                                SetBlipSprite(blipGPS, Config.Blip.SpriteGPS)
                                SetBlipColour(blipGPS, Config.Blip.ColorGPS)
                                SetBlipScale(blipGPS, Config.Blip.ScaleBlipGPS)
                                SetBlipAsShortRange(blipGPS, true)
                                SetBlipRoute(blipGPS, true)
                                SetBlipAlpha(blipGPS, Config.Blip.BlipAlpha)
                                BeginTextCommandSetBlipName("STRING")
                                AddTextComponentString(Config.Blip.BlipNameGPS)
                                EndTextCommandSetBlipName(blipGPS)
                                RageUI.CloseAll()
                                while true do
                                    Wait(1)
                                    local playerCoords = GetEntityCoords(PlayerPedId())
                                    local distance = #(playerCoords - vector3(v.positionGPS.x, v.positionGPS.y, v.positionGPS.z))
                                    if distance < 5.0 then
                                        DrawMarker(1, v.positionGPS.x, v.positionGPS.y, v.positionGPS.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 4.0, 4.0, 4.0, 255, 0, 0, 255, 55555, false, true, 2, false, false, false, false)
                                        ESX.ShowHelpNotification(Config.Notification.ShowHelpNotificationFinish)
                                        if IsControlJustPressed(0, 51) then
                                            local goodVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                            if goodVehicle == vehicleMission then
                                                DeleteEntity(vehicleMission)
                                                TriggerServerEvent("Ramoune:FinishMission", v.price)
                                                SetGpsMultiRouteRender(false)
                                                RemoveBlip(blipGPS)
                                                SetBlipRoute(blipGPS, false)
                                                ESX.ShowAdvancedNotification(Config.AdvancedNotification.finMission.title, Config.AdvancedNotification.finMission.subject, Config.AdvancedNotification.finMission.msg..v.price.."$", Config.AdvancedNotification.finMission.icon, 1)
                                                SpawnFinishMission(v.modelVehicleFinish)
                                                ESX.ShowNotification(Config.Notification.ShowNotificationFinish)
                                                inMission = false
                                                break
                                            else
                                                ESX.ShowAdvancedNotification(Config.AdvancedNotification.wrongVehicle.title, Config.AdvancedNotification.wrongVehicle.subject, Config.AdvancedNotification.wrongVehicle.msg, Config.AdvancedNotification.wrongVehicle.icon, 1)
                                            end
                                        end
                                    end
                                end
                            end
                        })
                    end
                end)
            end
        end)
    end
end
