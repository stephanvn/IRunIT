    // The buffer that just arrived
    var buff = ds_map_find_value(async_load, "buffer");
    // This is a single number that indicates what kind of message we're dealing with, sort of like a unique identifier
    var cmd = buffer_read(buff, buffer_s16 );
    // The socket that belongs to the client that sent this message
    var sock = ds_map_find_value(async_load, "id");
    // Get the player object that belongs to this socket
    var other_player = ds_map_find_value(players, sock );

    
    // Is this a KEY command?
    switch (cmd)
    {
        case 1: // New player joined
            other_player.name = buffer_read(buff, buffer_string);
            buffer_seek(buff, buffer_seek_start, 0);
            buffer_write(buff, buffer_s16, 0);
            buffer_write(buff, buffer_s16, other_player.capital);
            network_send_packet(sock, buff, buffer_tell(buff));
        break;
        
        case 2: // Receive a bid from a client
            other_player.bid = buffer_read(buff, buffer_s16);
            currentHighestBid = ds_map_find_value(bidlist, "bid");
            
            // If there are no bids yet.. add the first bidder to the list
            if is_undefined(currentHighestBid) 
            {
                ds_map_add(bidlist, "bid", other_player.bid);
                ds_map_add(bidlist, "name", other_player.name);
            }
            
            else if(other_player.bid > currentHighestBid) 
            {
                ds_map_clear(bidlist);
                ds_map_add(bidlist, "bid", other_player.bid);
                ds_map_add(bidlist, "name", other_player.name);
                
                show_message("Hoogste bod tot nu toe: $" + string(ds_map_find_value(bidlist, "bid")));
                show_message("Geboden door: " + string(ds_map_find_value(bidlist, "name")));
            }
            
            if(WaitForBids()) 
            {
                other_player.capital -= ds_map_find_value(bidlist, "bid");
                show_message("Je geld is afgeschreven! Je hebt nu nog: " + string(other_player.capital));
            }
            
        break;
    
        case 3: // Change sprite back (client released enter)
            //other_player.sprite_index = spr_blue;
        break;    
            
        case 4: // You can keep adding network events endlessly like this
        break;
    }
