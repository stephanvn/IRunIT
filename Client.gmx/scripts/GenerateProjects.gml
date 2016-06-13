// Script for generating projects. Creates new projects and 
// argugment0 = amount of projects to generate
// arugment1 = project category
LoadProjectcardJson();
var projectsMap;

for (var i = 0; i < argument0; i++) 
{
    var p = instance_create(0, 0, obj_project);
    
    var item = 0;
    var card = 0;
    switch(argument1) 
    {
        case 1: item = floor(random(global.totalCards1));
                card = global.cardData1;
                break;
        case 2: item = floor(random(global.totalCards2));
                card = global.cardData2;
                break;
        case 3: item = floor(random(global.totalCards3));
                card = global.cardData3;
                break;
    }
    
    
    p.name = card[# item, TITEL];
    p.category = argument1;
    
    p.project_id = global.projectID++;
    p.req_blue = card[# item, BLUE];
    p.req_red = card[# item, RED];
    p.req_yellow = card[# item, YELLOW];
    p.req_green = card[# item, GREEN];
    
    p.month1_value = card[# item, NIEUW];
    p.month2_value = card[# item, MAANDTWEE];
    p.month3_value = card[# item, MAANDDRIE];
    p.month4_expired = card[# item, VERWIJDEREN];

    
    switch (argument1) {
        case 1: ds_map_add(projects1, i, p); break;
        case 2: ds_map_add(projects2, i, p); break;
        case 3: ds_map_add(projects3, i, p); break;
    }
}
