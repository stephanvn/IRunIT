obj_controller.canPickProjects = false;
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff, buffer_s16, 3);
buffer_write(buff, buffer_u8, ds_list_size(pickedProjects));
for (var i=0; i<ds_list_size(pickedProjects); i++) 
{
    buffer_write(buff, buffer_u8, ds_list_find_value(pickedProjects, i));
    obj_controller.state = "Other people are picking projects";
}
network_send_packet(client, buff, buffer_tell(buff));
