function printSmallGuildNames(memberCount)
    --This method is meant to print the names of all guilds that have less than 'memberCount' max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    local guildName = result.getString("name")
    print(guildName)
end