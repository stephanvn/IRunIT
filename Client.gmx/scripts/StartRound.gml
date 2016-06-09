// starts a game round
buffer_seek(sendbuff, buffer_seek_start, 0);
buffer_write(sendbuff, buffer_s16, 5);
SendToEveryone();
