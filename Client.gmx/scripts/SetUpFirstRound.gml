var amount_projects = 2;

for (var i=0; i<ds_map_size(players); i++) 
{
    amount_projects += 2;       
}

for (var j=0; j<amount_projects; j++) 
{
    var p = instance_create(0, 0, obj_project);
    p.name = "Test project";
    p.category = 1;
    
    p.project_id = j;
    p.req_blue = 2;
    p.req_red = 2;
    p.req_yellow = 2;
    p.req_green = 2;
    
    p.month1_value = 100;
    p.month2_value = 90;
    p.month3_value = 80;
    p.month4_expired = 70;
}
