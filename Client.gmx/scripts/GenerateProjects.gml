// Script for generating projects. Creates new projects and 
// argugment0 = amount of projects to generate
// arugment1 = project category

var projectsMap;

for (var i = 0; i < argument0; i++) 
{
    var p = instance_create(0, 0, obj_project);
    
    p.req_blue = 2;
    p.req_red = 2;
    p.req_yellow = 2;
    p.req_green = 2;    
    p.month1_value = 100;
    p.month2_value = 90;
    p.month3_value = 80;
    p.month4_expired = 70;
    
    switch (argument1) {
        case 1: ds_map_add(projects1, i, p); break;
        case 2: ds_map_add(projects2, i, p); break;
        case 3: ds_map_add(projects3, i, p); break;
    }
}
