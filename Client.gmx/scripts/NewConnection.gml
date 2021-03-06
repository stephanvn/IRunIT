    //NOTE: ds_lists are basically GameMaker's version of arraylists. We'll be using ds_lists to store all the connected clients.

    // Get the type of the arrived message. 1 = connect, else = disconnect
    var type = ds_map_find_value(async_load, "type");
    // The ID of the new socket
    var sock = ds_map_find_value(async_load, "socket");
    // The IP that belongs to the new socket
    var ip = ds_map_find_value(async_load, "ip");

    // If we're dealing with a new connection
    if (type == 1)
    {
        var obj = instance_create(0, 0, obj_client_dummy);
        obj.player_number = ds_map_size(players);
        obj.socket = sock;
        // Add client to our list of connected clients
        ds_list_add(socketlist, sock);
        // Store this object in a ds_map along with the socket so we can easily look it up later
        ds_map_add(players, sock, obj);
    }
    else     // If we're dealing with someone disconnecting from the game
    {
        ds_list_delete(socketlist, ds_list_find_index(socketlist, sock) ); // Remove from our client list. Again, very similar to ArrayLists
        ds_map_delete(players, ds_map_find_value(players, sock )); // Remove the entry from our client object list as well
        with (ds_map_find_value(players, sock )) { instance_destroy(); }         // Finally, delete the object associated with the socket
    }
