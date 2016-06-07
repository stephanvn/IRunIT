// Lets people pick their project cards in turn

if (bidturn < ds_list_size(bidlist)) 
{
    var obj = ds_map_find_value(bidmap, ds_list_find_value(bidlist, bidturn));
    buffer_seek(sendbuff, buffer_seek_start, 0);
    buffer_write(sendbuff, buffer_s16, 3);
    network_send_packet(obj.socket, sendbuff, buffer_tell(sendbuff));
    bidturn++;
}
else { StartRound(); }
