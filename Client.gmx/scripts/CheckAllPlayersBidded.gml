var result = true;

for (var i=0; i < ds_list_size(socketlist); i++) 
{
    var playerloop = ds_map_find_value(players, ds_list_find_value(socketlist, i));
    if (playerloop.bid == -1) 
    {
        result = false;
    }
}
return result;
