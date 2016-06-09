// Lets people pick their project cards in turn
/*
//DEBUG: Determine the key searched for in map "bidmap".
show_message("Value in list w/ pos="+string(bidturn)
            +" is: "+string(ds_list_find_value(bidlist, bidturn)));
*/

if(ds_map_size(bidmap) == 0) 
{
    StartRound();
}
else 
{
    bidturn = ds_map_find_first(bidmap);
    
    
    var highest = bidturn;
    
    for(i = 1 ; i < ds_map_size(bidmap) ; i++)
    {
        bidturn = ds_map_find_next(bidmap, bidturn);
        if(highest.bid < bidturn.bid) highest = bidturn;
        
        
    }
    
    buffer_seek(sendbuff, buffer_seek_start, 0);
    buffer_write(sendbuff, buffer_s16, 3);
    network_send_packet(highest.socket, sendbuff, buffer_tell(sendbuff));
    
    ds_map_delete(bidmap, highest);
}
/*
if (bidturn < ds_list_size(bidlist)) 
{
    var obj = ds_map_find_value(bidmap, ds_list_find_value(bidlist, bidturn));    
    
    bidturn++;
}
else { StartRound(); }*/
