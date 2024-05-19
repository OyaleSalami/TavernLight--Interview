function do_sth_with_PlayerParty(playerId, memebername)
    player = Player(playerId)
    local party = player.getParty()

    for k,v in pairs(party:getMembers()) do
        if v == Player(memebername) then
            party:removeMember(Player(memebername))
        end
    end
end