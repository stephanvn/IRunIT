// Script for generating projects. Creates new projects and 
// argugment0 = amount of projects to generate
// arugment1 = project category

var projectsMap;

for (var i = 0; i < argument0; i++) 
{
    var p = instance_create(0, 0, obj_project);
    
    var i = floor(random(global.totalCards1));
      
    p.name = global.cardData1[# i, TITEL];
    p.category = argument1;
    
    p.project_id = i;
    p.req_blue = global.cardData1[# i, BLUE];
    p.req_red = global.cardData1[# i, RED];
    p.req_yellow = global.cardData1[# i, YELLOW];
    p.req_green = global.cardData1[# i, GREEN];
    
    p.month1_value = global.cardData1[# i, NIEUW];
    p.month2_value = global.cardData1[# i, MAANDTWEE];
    p.month3_value = global.cardData1[# i, MAANDDRIE];
    p.month4_expired = global.cardData1[# i, VERWIJDEREN];
    
    switch (argument1) {
        case 1: ds_map_add(projects1, i, p); break;
        case 2: ds_map_add(projects2, i, p); break;
        case 3: ds_map_add(projects3, i, p); break;
    }
}
