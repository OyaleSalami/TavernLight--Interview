void Game::addItemToPlayer(const std::string& recipient, uint 16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);

    if(!player)
    {
        player = new Player(nullptr); //Create a new player if we are unable to get one
        if(!IOLoginData::loadPlayeryName(player, recipient))
        {
            delete(player); //Free up the memory created
            return;
        }

        Item* item = Item::CreateItem(itemId);
        if(!item)
        {
            delete(player); //Free up the memory created
            return;
        }

        g_game.InternalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

        if(player->isOffline())
        {
            IOLoginData::savePlayer(player);
            /**
                *If this stores the pointer somehwere, then calling a delete() would be harmful
                *If it doesn't then the memory referenced by the pointer should be freed up
                *It's hard to tell but I won't free up the memory here
            **/
        }
        
        /**
            *This section has the memory freeing parts because it's here we allocated the memory 
        **/
    }
    else
    {
        Item* item = Item::CreateItem(itemId);
        if(!item)
        {
            return;
        }

        g_game.InternalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

        if(player->isOffline())
        {
            IOLoginData::savePlayer(player);
        }

        /**
            *I don't call the delete function here because we didn't assign memory for the player in this section
            *Calling the delete function here might free up memory that might be used elsewhere
            *So the function should only clean up memory where it requested for it
        **/
    }
}

/**
    *I also worked with some assumptions in mind becaue the code is not all that clear
    *if g_game.getPlayerByName(recipient); returns a reference to a player object that is being used
    *elsewhere, deleting it would cause unexplainable bugs so I think it's best if it works like this
**/