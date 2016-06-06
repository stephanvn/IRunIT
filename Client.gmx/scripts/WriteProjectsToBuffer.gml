//This script writes all the projects passed in arugment0 to the network buffer
var p;

for (var i = 0; i < ds_map_size(argument0); i++) {
    p = ds_map_find_value(argument0, i);
    
    buffer_write(sendbuff, buffer_u8, p.project_id); 
    buffer_write(sendbuff, buffer_string, p.name);
    buffer_write(sendbuff, buffer_u8, p.category);
    buffer_write(sendbuff, buffer_u8, p.req_blue);
    buffer_write(sendbuff, buffer_u8, p.req_red);
    buffer_write(sendbuff, buffer_u8, p.req_yellow);
    buffer_write(sendbuff, buffer_u8, p.req_green);
    buffer_write(sendbuff, buffer_s16, p.month1_value);
    buffer_write(sendbuff, buffer_s16, p.month2_value);
    buffer_write(sendbuff, buffer_s16, p.month3_value);
    buffer_write(sendbuff, buffer_s16, p.month4_expired);
}
