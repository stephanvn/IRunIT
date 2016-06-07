/* Zorg er eerst ff voor dat je die lijsten etc aanmaakt en een duidelijke naam geeft zodat de functie voor die lijst duidelijk is

var jsonFile1 = file_text_open_read("categorie1.json");
var jsonFile2 = file_text_open_read("categorie2.json");
var jsonFile3 = file_text_open_read("categorie3.json");

var data1 = "";
while (!file_text_eof(jsonFile1))
{
    data1 += file_text_read_string(jsonFile1);
    file_text_readln(jsonFile1);
}
file_text_close(jsonFile1);

var data2 = "";
while (!file_text_eof(jsonFile2))
{
    data2 += file_text_read_string(jsonFile2);
    file_text_readln(jsonFile2);
}
file_text_close(jsonFile2);

var data3 = "";
while (!file_text_eof(jsonFile3))
{
    data3 += file_text_read_string(jsonFile3);
    file_text_readln(jsonFile3);
}
file_text_close(jsonFile3);

var jsonMap1 = json_decode(data1);
var list1 = ds_map_find_value(jsonMap1, "default");
global.totalCards1 = ds_list_size(list1);
global.cardData1 = ds_grid_create(global.totalCards1,10); //second int is amount of variables
for (var i = 0; i < global.totalCards1; i++)
{
    var theEntry = ds_list_find_value(list1, i);
    global.cardData1[# i, BLUE] = theEntry[? "BLUE"];
    global.cardData1[# i, GREEN] = theEntry[? "GREEN"];
    global.cardData1[# i, YELLOW] = theEntry[? "YELLOW"];
    global.cardData1[# i, RED] = theEntry[? "RED"];
    global.cardData1[# i, NIEUW] = theEntry[? "NIEUW"];
    global.cardData1[# i, MAANDTWEE] = theEntry[? "MAANDTWEE"];
    global.cardData1[# i, MAANDDRIE] = theEntry[? "MAANDDRIE"];
    global.cardData1[# i, VERWIJDEREN] = theEntry[? "VERWIJDEREN"];
    global.cardData1[# i, TITEL] = theEntry[? "TITEL"];
    global.cardData1[# i, VOORDEEL] = theEntry[? "VOORDEEL"];
}

var jsonMap2 = json_decode(data2);
var list2 = ds_map_find_value(jsonMap2, "default");
global.totalCards2 = ds_list_size(list2);
global.cardData2 = ds_grid_create(global.totalCards2,10); //second int is amount of variables
for (var i = 0; i < global.totalCards2; i++)
{
    var theEntry = ds_list_find_value(list2, i);
    global.cardData2[# i, BLUE] = theEntry[? "BLUE"];
    global.cardData2[# i, GREEN] = theEntry[? "GREEN"];
    global.cardData2[# i, YELLOW] = theEntry[? "YELLOW"];
    global.cardData2[# i, RED] = theEntry[? "RED"];
    global.cardData2[# i, NIEUW] = theEntry[? "NIEUW"];
    global.cardData2[# i, MAANDTWEE] = theEntry[? "MAANDTWEE"];
    global.cardData2[# i, MAANDDRIE] = theEntry[? "MAANDDRIE"];
    global.cardData2[# i, VERWIJDEREN] = theEntry[? "VERWIJDEREN"];
    global.cardData2[# i, TITEL] = theEntry[? "TITEL"];
    global.cardData2[# i, VOORDEEL] = theEntry[? "VOORDEEL"];
}

var jsonMap3 = json_decode(data3);
var list3 = ds_map_find_value(jsonMap3, "default");
global.totalCards3 = ds_list_size(list3);
global.cardData3 = ds_grid_create(global.totalCards3,10); //second int is amount of variables
for (var i = 0; i < global.totalCards3; i++)
{
    var theEntry = ds_list_find_value(list3, i);
    global.cardData3[# i, BLUE] = theEntry[? "BLUE"];
    global.cardData3[# i, GREEN] = theEntry[? "GREEN"];
    global.cardData3[# i, YELLOW] = theEntry[? "YELLOW"];
    global.cardData3[# i, RED] = theEntry[? "RED"];
    global.cardData3[# i, NIEUW] = theEntry[? "NIEUW"];
    global.cardData3[# i, MAANDTWEE] = theEntry[? "MAANDTWEE"];
    global.cardData3[# i, MAANDDRIE] = theEntry[? "MAANDDRIE"];
    global.cardData3[# i, VERWIJDEREN] = theEntry[? "VERWIJDEREN"];
    global.cardData3[# i, TITEL] = theEntry[? "TITEL"];
    global.cardData3[# i, VOORDEEL] = theEntry[? "VOORDEEL"];
}

*/
