    // argument0 = other_play_name entered text
    var playerNameText = argument0;
    var otherPlayerObj = argument1;
    var sock = argument2;
        
    buffer_seek(sendbuff, buffer_seek_start, 0);
    buffer_write(sendbuff, buffer_s16, 0);
    buffer_write(sendbuff, buffer_u16, otherPlayerObj.capital);
    buffer_write(sendbuff, buffer_u16, otherPlayerObj.workers_red);
    buffer_write(sendbuff, buffer_u16, otherPlayerObj.workers_blue);
    buffer_write(sendbuff, buffer_u16, otherPlayerObj.workers_yellow);
    buffer_write(sendbuff, buffer_u16, otherPlayerObj.workers_green);
    buffer_write(sendbuff, buffer_u16, otherPlayerObj.skill_troubleshooting);
    buffer_write(sendbuff, buffer_u16, otherPlayerObj.skill_intel);
    buffer_write(sendbuff, buffer_u16, otherPlayerObj.skill_teamwork);
    buffer_write(sendbuff, buffer_u16, otherPlayerObj.skill_communication);
    buffer_write(sendbuff, buffer_u16, otherPlayerObj.skill_planning);
    network_send_packet(sock, sendbuff, buffer_tell(sendbuff));
