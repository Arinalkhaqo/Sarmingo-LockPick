ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('provjera', function(source,cb,item)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.getInventoryItem('lockpick').count >= 1 then
		cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('ukloni', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('lockpick', 1)
end)