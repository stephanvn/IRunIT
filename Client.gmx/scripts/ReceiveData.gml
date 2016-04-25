var buff = ds_map_find_value(async_load, "buffer"); // The buffer that just arrived
var cmd = buffer_read(buff, buffer_s16 ); // This is a single number that indicates what kind of message we're dealing with, sort of like a unique identifier
var sock = ds_map_find_value(async_load, "id"); // The socket that belongs to the client that sent this message
var other_player = ds_map_find_value(players, sock ); // Get the player object that belongs to this socket

// Is this a KEY command?
switch (cmd)
{
    case 1: // New player joined
        other_player.name = buffer_read(buff, buffer_string);
    break;
    
    case 2: // Change sprite (client pressed enter)
        other_player.sprite_index = spr_red;
    break;

    case 3: // Change sprite back (client released enter)
        other_player.sprite_index = spr_blue;
    break;    
        
    case 4: // You can keep adding network events endlessly like this
        //placeholder
    break;
}
