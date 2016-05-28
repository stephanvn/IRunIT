    globalvar highestBidder;
    globalvar highestBidderBuffer;
    globalvar highestBidderSock;
    
    currentHighestBid = ds_map_find_value(bidlist, "bid");
    other_player = argument0;
    sock = argument1;
    buff = argument2;
    
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
        buffer_seek(highestBidderBuffer, buffer_seek_start, 0);
        buffer_write(highestBidderBuffer, buffer_s16, 2); //Write a single byte (2) as an identifier for this message
        buffer_write(highestBidderBuffer, buffer_u8, highestBidder.bid); //Write the amount that the highest bidder bidded to the buffer
        network_send_packet(highestBidderSock, highestBidderBuffer, buffer_tell(highestBidderBuffer)); 
        show_message("CheckAllPlayersBidded If in SortPlayerBids");
    }  
