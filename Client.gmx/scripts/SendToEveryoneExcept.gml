// argument0 = if you want to exclude someone from the send list
var exception = argument0;

for (var i=0; i<ds_list_size(socketlist); i++)
{
    if (ds_list_find_value(socketlist, i) != exception) {
    network_send_packet( ds_list_find_value(socketlist, i), sendbuff, buffer_tell(sendbuff)); }
}
