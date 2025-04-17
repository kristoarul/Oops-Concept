trigger Show_the_msg on Contact (before insert) {
for(contact c:trigger.new)
{
    c.Description='THI IS CONTACT OBJECT';
    System.debug(c.Description);
}
}