ESX = exports['es_extended']:getSharedObject()

RegisterCommand('lockpick', function()
    local coords = GetEntityCoords(PlayerPedId())
    vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    ESX.TriggerServerCallback('check', function(check)
        if check then
    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
        RequestAnimDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
        while not HasAnimDictLoaded('anim@amb@clubhouse@tutorial@bkr_tut_ig3@') do
            Citizen.Wait(0)
        end
        TaskPlayAnim(PlayerPedId(), 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@' , 'machinic_loop_mechandplayer' ,8.0, -8.0, -1, 1, 0, false, false, false)
        local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 1}, 'easy'})
        if success then
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
            ClearPedTasksImmediately(PlayerPedId())
            ESX.ShowNotification('Lockpicked successfully')
        else
            ClearPedTasksImmediately(PlayerPedId())
            SetVehicleAlarm(vehicle, true)
            SetVehicleAlarmTimeLeft(vehicle, 60 * 1000)
            TriggerServerEvent('remove')
            ESX.ShowNotification('Run, the police have been called')
        end
    else
    ESX.ShowNotification('There are no vehicles nearby')
    end
else
    ESX.ShowNotification("You don't have a lockpick")
    end
end)
end)
