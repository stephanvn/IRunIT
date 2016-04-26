    
    //NOTE: ds_lists are basically GameMaker's version of arraylists. We'll be using ds_lists to store all the connected clients.

    var type = ds_map_find_value(async_load, "type"); // Get the type of the arrived message. 1 = connect, else = disconnect
    var sock = ds_map_find_value(async_load, "socket"); // The ID of the new socket
    var ip = ds_map_find_value(async_load, "ip"); // The IP that belongs to the new socket

    // If we're dealing with a new connection
    if (type == 1)
    {
        var obj = instance_create(0, 0, obj_client_dummy);
        obj.player_number = ds_map_size(players);
        ds_list_add(socketlist, sock); // Add client to our list of connected clients
        ds_map_add(players, sock, obj); // Store this object in a ds_map along with the socket so we can easily look it up later
    }
    // If we're dealing with someone disconnecting from the game
    else
    {
        var index1 = ds_list_find_index(socketlist, sock); // Get the index in our ds_list of the disconnecting client.
        var index2 = ds_map_find_value(players, sock ); // Get the player object that belongs to this socket
        ds_list_delete(socketlist, index1); // Remove from our client list. Again, very similar to ArrayLists
        ds_map_delete(players, index2); // Remove the entry from our client object list as well
    
        with (index2) { instance_destroy(); } // Finally, delete the object associated with the socket
    }
