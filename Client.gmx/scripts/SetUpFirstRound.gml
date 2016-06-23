var amount_projects = 2;
names_players = ds_list_create();
balances_players = ds_list_create();

for (var i=0; i<ds_map_size(players); i++) 
{
    amount_projects += 2;
    var index = ds_list_find_value(socketlist, i);
    player = ds_map_find_value(players, index);
    //show_message("Speler " + string(player.name) + " heeft bedrag " + string(player.capital) + "."); //DEBUG
    ds_list_add(names_players, player.name);
    ds_list_add(balances_players, player.capital);
}

CreateAndSendProjects();

buffer_seek(sendbuff, buffer_seek_start, 0);
buffer_write(sendbuff, buffer_s16, 7);
buffer_write(sendbuff, buffer_u8, ds_list_size(names_players));
WriteDataTeamsToBuffer(names_players, balances_players);
SendToEveryone();
