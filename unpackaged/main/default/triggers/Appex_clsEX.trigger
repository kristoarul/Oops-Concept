trigger Appex_clsEX on Account (before insert) {
    if(trigger.isbefore && trigger.isinsert){
        ApexHandler.display(trigger.new);
    }
   
}