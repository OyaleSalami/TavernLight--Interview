function printSmallGuildNames(memberCount)
    --This method is meant to print the names of all guilds that have less than 'memberCount' max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local result = db.storeQuery(string.format(selectGuildQuery, memberCount))

    if(type(result) == "table") then --Little error handling just in case something went wrong and "result" is not a table
	    for k,v in pairs(result) do
	        print(v)
	    end
	end
end

--[[
	--The query is meant to return a list of values (a table in lua)
	--So "result" should be a table if everything goes well

	--There are a bunch of uncertainties though, 
	--I'm not sure how the database is structured
	--It might return a different object type and not a list (table)
--]]