var error = false;

for (var i=0; i < ds_list_size(socketlist); i++) 
{
    var playerloop = ds_map_find_value(players, ds_list_find_value(socketlist, i));
    if (playerloop.bid == -1) 
    {
        error = true;
    }
}
if (error == false) 
{
    show_message("De biedronde is afgelopen!");
    show_message("Hoogste bod: $" + string(ds_map_find_value(bidlist, "bid")));
    show_message("Geboden door: " + string(ds_map_find_value(bidlist, "name")));
    return true;
}
