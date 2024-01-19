RegisterServerEvent("Ramoune:FinishMission")
AddEventHandler("Ramoune:FinishMission", function(price)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney('money', price)
end)