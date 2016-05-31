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
        
        case 2: // Receive a bid from a client during the bid round
            other_player.bid = buffer_read(buff, buffer_s16);
            ds_list_add(bidlist, other_player.bid);
            ds_map_add(bidmap, other_player.bid, other_player);
            ds_list_sort(bidlist, false);
            
            other_player.capital -= other_player.bid;
            buffer_seek(buff, buffer_seek_start, 0);
            buffer_write(buff, buffer_s16, 2);
            buffer_write(buff, buffer_u16, other_player.capital);
            network_send_packet(sock, buff, buffer_tell(buff));
            
            if (CheckAllPlayersBidded()) 
            {
                    var obj = ds_map_find_value(bidmap, ds_list_find_value(bidlist, 0));
                    buffer_seek(buff, buffer_seek_start, 0);
                    buffer_write(buff, buffer_s16, 3);
                    network_send_packet(obj.socket, buff, buffer_tell(buff));
            }
        break;
    
        case 3: // Change sprite back (client released enter)

        break;    
            
        case 4: // You can keep adding network events endlessly like this
        break;
    }
