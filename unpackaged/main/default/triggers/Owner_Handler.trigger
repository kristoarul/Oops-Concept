trigger Owner_Handler on Contact (before insert) {
    if(trigger.isbefore&&trigger.isinsert){
        To_Print_OwnerName.print(trigger.new);
    }

}