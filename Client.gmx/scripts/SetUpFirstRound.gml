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

GenerateProjects(amount_projects, 1);
buffer_seek(sendbuff, buffer_seek_start, 0);
buffer_write(sendbuff, buffer_s16, 1); //Write a single byte (1) as an identifier for this message
buffer_write(sendbuff, buffer_u8, amount_projects); //Write the amount of projects we just generated so the client knows what's up
WriteProjectsToBuffer(projects1);
SendToEveryone();

buffer_seek(sendbuff, buffer_seek_start, 0);
buffer_write(sendbuff, buffer_s16, 7);
buffer_write(sendbuff, buffer_u8, ds_list_size(names_players));
WriteDataTeamsToBuffer(names_players, balances_players);
SendToEveryone();

buffer_seek(sendbuff, buffer_seek_start, 0);
buffer_write(sendbuff, buffer_s16, 8);
SendToEveryone();
