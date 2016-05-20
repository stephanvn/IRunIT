for (var i=0; i<ds_list_size(socketlist); i++)
{
    network_send_packet( ds_list_find_value(socketlist, i), buff, buffer_tell(buff));
}
