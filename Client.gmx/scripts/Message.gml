// function to show messages
// argument0 = the message
// argument1 = special type of message

if (!instance_exists(obj_message)) 
{
    var o = instance_create(0, 0, obj_message);
    o.text = argument0;
    o.type = argument1;
    
    var button = instance_create(0, 0, obj_closebutton);
}
