//This script writes all the player names&balances passed in argument0&argument1 to the network buffer
var name_player;
var balance_player;

for (var i=0; i < ds_list_size(argument0); i++) 
{
    name_player = ds_list_find_value(argument0, i);
    balance_player = ds_list_find_value(argument1, i);
    buffer_write(sendbuff, buffer_string, name_player);
    buffer_write(sendbuff, buffer_u16, balance_player);
}
