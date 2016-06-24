var amountOfPlayers = ds_map_size(players);
ds_map_clear(projects1);
ds_map_clear(projects2);
ds_map_clear(projects3);

for(var i = 3 ; i < 4 ; i++)
{
    var amountOfCards = 0;
    var saveMap = 0;
    if(i == 1) 
    {
        saveMap = projects1;
        amountOfCards += 2;
    }
    else if(i == 2)
    {
        saveMap = projects2;
    }
    else if(i == 3)
    {
        saveMap = projects3;
    }
    amountOfCards += (amountOfPlayers*2);
    GenerateProjects(amountOfCards, i);
    buffer_seek(sendbuff, buffer_seek_start, 0);
    buffer_write(sendbuff, buffer_s16, 1); //Write a single byte (1) as an identifier for this message
    buffer_write(sendbuff, buffer_u8, amountOfCards); //Write the amount of projects we just generated so the client knows what's up
    WriteProjectsToBuffer(saveMap);
    SendToEveryone();
}


