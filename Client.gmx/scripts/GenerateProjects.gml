// Script for generating projects. Creates new projects and 
// argugment0 = amount of projects to generate
// arugment1 = project category
LoadProjectcardJson();
var projectsMap;

for (var i = 0; i < argument0; i++) 
{
    var p = instance_create(0, 0, obj_project);
    
    var item = floor(random(global.totalCards1));
    p.name = global.cardData1[# i, TITEL];
    p.category = argument1;
    
    p.project_id = i;
    p.req_blue = global.cardData1[# item, BLUE];
    p.req_red = global.cardData1[# item, RED];
    p.req_yellow = global.cardData1[# item, YELLOW];
    p.req_green = global.cardData1[# item, GREEN];
    
    p.month1_value = global.cardData1[# item, NIEUW];
    p.month2_value = global.cardData1[# item, MAANDTWEE];
    p.month3_value = global.cardData1[# item, MAANDDRIE];
    p.month4_expired = global.cardData1[# item, VERWIJDEREN];

    
    switch (argument1) {
        case 1: ds_map_add(projects1, i, p); break;
        case 2: ds_map_add(projects2, i, p); break;
        case 3: ds_map_add(projects3, i, p); break;
    }
}
