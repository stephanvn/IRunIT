//This script writes all the player names passed in argument0 to the network buffer
var name_player;

for (var i=0; i < ds_list_size(argument0); i++) 
{
    name_player = ds_list_find_value(argument0, i);
    buffer_write(sendbuff, buffer_string, name_player);
}
