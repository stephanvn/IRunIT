    var amount = argument0;
    var sock = argument1;
    var buff = argument2;

    global.chosenprojects = ds_list_create();
    for (var i=0; i<amount; i++) 
    {
        ds_list_add(global.chosenprojects, buffer_read(buff, buffer_u8));
    }
    with (obj_project) 
    {
        for (var j=0; j<ds_list_size(global.chosenprojects); j++) 
        {
            if (project_id == ds_list_find_value(global.chosenprojects, j)) 
            { 
                //ds_map_delete(projects1, project_id)
                instance_destroy(); 
            }
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
    LetNextPlayerPickProjects();
