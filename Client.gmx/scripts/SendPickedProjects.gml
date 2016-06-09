obj_controller.canPickProjects = false;
buffer_seek(sendbuff, buffer_seek_start, 0);
buffer_write(sendbuff, buffer_s16, 3);
buffer_write(sendbuff, buffer_u8, ds_list_size(pickedProjects));
for (var i=0; i<ds_list_size(pickedProjects); i++) 
{
    buffer_write(sendbuff, buffer_u8, ds_list_find_value(pickedProjects, i));
    obj_controller.state = "Other people are picking projects";
}
network_send_packet(client, sendbuff, buffer_tell(sendbuff));

with (obj_project) 
{
    for (var j=0; j<ds_list_size(pickedProjects); j++) 
    {
        if (project_id == ds_list_find_value(pickedProjects, j)) { 
            instance_destroy(); }
    }
}
