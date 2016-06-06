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
            obj_controller.capital = buffer_read(buff, buffer_u16);
        break;
        
        case 1: // The server has started the game and the server has sent us the available projects
            obj_controller.state = "bidding";
            // Amount of projects
            var amount = buffer_read(buff, buffer_u8);
            for (var i=0; i<amount; i++) 
            {
                var p = instance_create(0, 0, obj_project);
                p.project_id = buffer_read(buff, buffer_u8); 
                p.name = buffer_read(buff, buffer_string); 
                p.category = buffer_read(buff, buffer_u8); 
                p.req_blue = buffer_read(buff, buffer_u8); 
                p.req_red = buffer_read(buff, buffer_u8); 
                p.req_yellow = buffer_read(buff, buffer_u8); 
                p.req_green = buffer_read(buff, buffer_u8); 
                p.month1_value = buffer_read(buff, buffer_s16); 
                p.month2_value = buffer_read(buff, buffer_s16); 
                p.month3_value = buffer_read(buff, buffer_s16); 
                p.month4_expired = buffer_read(buff, buffer_s16); 
            }
        break;
        
        case 2: // Update capital information from the server
            obj_controller.capital = buffer_read(buff, buffer_u16);
        break;
        
        case 3: // Local client's turn to pick projects
            obj_controller.canPickProjects = true;
            obj_controller.state = "You get to pick your shitty projects now";
        break;
        
        case 4: // Remove projects chosen by someone else
        show_message("receive");
            var amount = buffer_read(buff, buffer_u8);
            var projectid;
            for (var i=0; i<amount; i++) 
            {
                projectid[i] = buffer_read(buff, buffer_u8);
            }
            with (obj_project) 
            {
                for (var j=0; j<array_length_1d(projectid); j++) 
                {
                    if (project_id == projectid[i]) { instance_destroy(); }
                }
            }
        break;
    }
