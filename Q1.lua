local objectId = 1000 --The name of this variable should reflect the object it represents

local function releaseStorage(player)
    player:setStorageValue(objectId, -1)
end

function onLogout(player)
    if player:getStorageValue(objectId) == 1 then
        releaseStorage(player) 
    end
    return true
end

--[[
	--The releaseStorage function should be called instantaneously on logout and not after 1000s
	--I think the code is more readable this way, I could have done this instead:

		function onLogout(player)
		    if player:getStorageValue(objectId) == 1 then
		        player:setStorageValue(objectId, -1) 
		    end
		    return true
		end

	--But having the releaseStorage function is good for readability and in case of expanded functionality
--]]