ESX = exports['es_extended']:getSharedObject()

RegisterCommand('obijauto', function()
    local kordinateigraca = GetEntityCoords(PlayerPedId())
    vozilo = GetClosestVehicle(kordinateigraca.x, kordinateigraca.y, kordinateigraca.z, 5.0, 0, 71)
    ESX.TriggerServerCallback('provjera', function(check)
        if check then
    if IsAnyVehicleNearPoint(kordinateigraca.x, kordinateigraca.y, kordinateigraca.z, 5.0) then
        RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
        while not HasAnimDictLoaded('anim@amb@clubhouse@tutorial@bkr_tut_ig3@') do
            Citizen.Wait(0)
        end
        TaskPlayAnim(PlayerPedId(), 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@' , 'machinic_loop_mechandplayer' ,8.0, -8.0, -1, 1, 0, false, false, false)
        local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 1}, 'easy'})
        if success then
            SetVehicleDoorsLockedForAllPlayers(vozilo, false)
            ClearPedTasksImmediately(PlayerPedId())
        else
            ClearPedTasksImmediately(PlayerPedId())
            SetVehicleAlarm(vozilo, true)
            SetVehicleAlarmTimeLeft(vozilo, 60 * 1000)
            TriggerServerEvent('ukloni')
        end
    else
    ESX.ShowNotification('Nema vozila u blizini')
    end
else
    ESX.ShowNotification('Nemas lockpick')
    end
end)
end)