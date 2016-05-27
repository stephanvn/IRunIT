
// If there are no bids yet.. add the first bidder to the list
if is_undefined(currentHighestBid) 
{
    ds_map_add(bidlist, "bid", other_player.bid);
    ds_map_add(bidlist, "name", other_player.name);
}

else if(other_player.bid > currentHighestBid) 
{
    ds_map_clear(bidlist);
    
    ds_map_add(bidlist, "bid", other_player.bid);
    ds_map_add(bidlist, "name", other_player.name);
    
    show_message("Hoogste bod tot nu toe: $" + string(ds_map_find_value(bidlist, "bid")));
    show_message("Geboden door: " + string(ds_map_find_value(bidlist, "name")));
}
