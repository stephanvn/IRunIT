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
            obj_controller.workers_red = buffer_read(buff, buffer_u16);
            obj_controller.workers_blue = buffer_read(buff, buffer_u16);
            obj_controller.workers_yellow = buffer_read(buff, buffer_u16);
            obj_controller.workers_green = buffer_read(buff, buffer_u16);
            obj_controller.skill_troubleshooting = buffer_read(buff, buffer_u16);
            obj_controller.skill_intel = buffer_read(buff, buffer_u16);
            obj_controller.skill_teamwork = buffer_read(buff, buffer_u16);
            obj_controller.skill_communication = buffer_read(buff, buffer_u16);
            obj_controller.skill_planning = buffer_read(buff, buffer_u16);
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
            obj_controller.state = "Your turn to pick projects";
        break;
        
        case 4: // Remove projects chosen by someone else
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
                        instance_destroy(); }
                }
            }
        break;
        
        case 5: //Round 1 started
            obj_controller.state = "Round 1 has begun";
            room_goto(rm_gamescreen);
        break;
        case 6: // Update bidded value @Client
            obj_controller.bid = buffer_read(buff, buffer_u16);
        break;
        case 7: // Same as case 1, but with names_players instead of projects
            // Amount of projects
            var amount = buffer_read(buff, buffer_u8);
            for (var i=0; i<amount; i++) 
            {
                var t_object = instance_create(1280 + 40 + 100*i, 40, obj_team); //596+(i*45) ?
                t_object.name = buffer_read(buff, buffer_string);
                t_object.balance = buffer_read(buff, buffer_u16);
                //show_message("Speler " + string(t_object.name) + " heeft bedrag " + string(t_object.balance) + "."); //DEBUG
                ds_list_add(teams, t_object);
            }
        break;
        case 8:
            var p_object = instance_create(1280 + 360, 265, obj_workers_place);
            var d_object = instance_create(1280 + 75, 66, obj_workers_desk_back);
        break;
    }
