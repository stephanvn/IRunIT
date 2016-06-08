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
            NewPlayerJoined(other_player.name, other_player, sock);
        break;

        case 2: // Receive a bid from a client during the bid round
            other_player.bid = buffer_read(buff, buffer_s16);
            ds_list_add(bidlist, other_player.bid);
            //BUG: The line below adds a player to a map, using its bid as a key.
            //     If Player 1 bids "5", and Player 2 bids "5",
            //     this code will attempt to add Player 2 with the same key as Player 1.
            //     In a map, no two keys can be the same.
            ds_map_add(bidmap, other_player.bid, other_player);
            ds_list_sort(bidlist, false);
            other_player.capital -= other_player.bid;
            buffer_seek(sendbuff, buffer_seek_start, 0);
            buffer_write(sendbuff, buffer_s16, 2);
            buffer_write(sendbuff, buffer_u16, other_player.capital);
            network_send_packet(sock, sendbuff, buffer_tell(sendbuff));
            if (CheckAllPlayersBidded()) 
            {
                LetNextPlayerPickProjects();
            }
        break;
        
        case 3: // Client has picked their projects
            var amount = buffer_read(buff, buffer_u8);
            MakeProjectSelection(amount, sock, buff);
        break;

        case 4: // You can keep adding network events endlessly like this
        break;
    }
