    // If there are no bids yet.. add the first bidder to the list
    if is_undefined(currentHighestBid) 
    {
        ds_map_add(bidlist, "bid", other_player.bid);
        ds_map_add(bidlist, "name", other_player.name);
        highestBidder = other_player;
        highestBidderBuffer = buff;
        highestBidderSock = sock;
    }
    
    else if(other_player.bid > currentHighestBid) 
    {
        ds_map_clear(bidlist);
        
        ds_map_add(bidlist, "bid", other_player.bid);
        ds_map_add(bidlist, "name", other_player.name);
        highestBidder = other_player;
        highestBidderBuffer = buff;
        highestBidderSock = sock;
        show_message(highestBidder);
    }
         
    if(CheckAllPlayersBidded())
    {

    }  
