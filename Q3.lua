function removeMemberFromParty(playerId, membername)
    player = Player(playerId)
    local party = player.getParty()

    for k,v in pairs(party:getMembers()) do
        if v == Player(membername) then
            party:removeMember(v) -- "v" here is the same thing as "Player(membername)"
        end
    end
end

--[[
	--My breakdown of this function
	--Player() is a function that can retrieve a player either by name or by id
	--playerId identifies the player removing someone? (Probably the creator of the party)
	--memberName identifies the player to be removed
--]]