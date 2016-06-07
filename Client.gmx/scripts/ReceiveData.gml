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
            buffer_seek(sendbuff, buffer_seek_start, 0);
            buffer_write(sendbuff, buffer_s16, 0);
            buffer_write(sendbuff, buffer_u16, other_player.capital);
            buffer_write(sendbuff, buffer_u16, other_player.workers_red);
            buffer_write(sendbuff, buffer_u16, other_player.workers_blue);
            buffer_write(sendbuff, buffer_u16, other_player.workers_yellow);
            buffer_write(sendbuff, buffer_u16, other_player.workers_green);
            network_send_packet(sock, sendbuff, buffer_tell(sendbuff));
        break;

        case 2: // Receive a bid from a client during the bid round
            other_player.bid = buffer_read(buff, buffer_s16);
            ds_list_add(bidlist, other_player.bid);
            ds_map_add(bidmap, other_player.bid, other_player);
            ds_list_sort(bidlist, false);
            
            other_player.capital -= other_player.bid;
            buffer_seek(sendbuff, buffer_seek_start, 0);
            buffer_write(sendbuff, buffer_s16, 2);
            buffer_write(sendbuff, buffer_u16, other_player.capital);
            network_send_packet(sock, sendbuff, buffer_tell(sendbuff));
            if (CheckAllPlayersBidded()) 
            {
                //IterateThroughBidders();
                var obj = ds_map_find_value(bidmap, ds_list_find_value(bidlist, 0));
                buffer_seek(sendbuff, buffer_seek_start, 0);
                buffer_write(sendbuff, buffer_s16, 3);
                network_send_packet(obj.socket, sendbuff, buffer_tell(sendbuff));
            }
        break;
        
        case 3: // Client has picked their projects
            var amount = buffer_read(buff, buffer_u8);
            global.chosenprojects = ds_list_create();
            for (var i=0; i<amount; i++) 
            {
                ds_list_add(global.chosenprojects, buffer_read(buff, buffer_u8));
            }
            with (obj_project) 
            {
                for (var j=0; j<ds_list_size(global.chosenprojects); j++) 
                {
                    if (project_id == ds_list_find_value(global.chosenprojects, j)) { 
                        ds_map_delete(projects1, project_id)
                        instance_destroy(); }
                }
            }
            buffer_seek(sendbuff, buffer_seek_start, 0);
            buffer_write(sendbuff, buffer_s16, 4);
            buffer_write(sendbuff, buffer_u8, amount);
            for (var i=0; i<amount; i++) 
            {
                buffer_write(sendbuff, buffer_u8, ds_list_find_value(global.chosenprojects, i) );
            }
            SendToEveryoneExcept(sock);
        break;

        case 4: // You can keep adding network events endlessly like this
        break;
    }
