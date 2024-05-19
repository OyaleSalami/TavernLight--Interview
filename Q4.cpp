void Game::addItemToPlayer(const std::string& recipient, uint 16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);
    if(!player)
    {
        player = new Player(nullptr);
        if(!IOLoginData::loadPlayeryName(player, recipient))
        {
            return;
        }
    }

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
}