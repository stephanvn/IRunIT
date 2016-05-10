    // The buffer that just arrived
    var buff = ds_map_find_value(async_load, "buffer");
    // This is a single number that indicates what kind of message we're dealing with, sort of like a unique identifier
    var cmd = buffer_read(buff, buffer_s16 );
    // The socket that belongs to the client that sent this message
    var sock = ds_map_find_value(async_load, "id");
    
    // Is this a KEY command?
    switch (cmd)
    {
        case 0: // New player joined
            obj_controller.state = "waiting";
        break;
        
        case 1: // The server has started the game
            obj_controller.state = "playing";
        break;
    }
