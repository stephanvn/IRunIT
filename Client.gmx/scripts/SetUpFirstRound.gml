var amount_projects = 2;

for (var i=0; i<ds_map_size(players); i++) 
{
    amount_projects += 2;
}

GenerateProjects(amount_projects, 1);
buffer_seek(sendbuff, buffer_seek_start, 0);
buffer_write(sendbuff, buffer_s16, 1); //Write a single byte (1) as an identifier for this message
buffer_write(sendbuff, buffer_u8, amount_projects); //Write the amount of projects we just generated so the client knows what's up
WriteProjectsToBuffer(projects1);
SendToEveryone();
