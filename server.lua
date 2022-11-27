ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('check', function(source,cb,item)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem('lockpick').count >= 1 then
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('remove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('lockpick', 1)
end)
