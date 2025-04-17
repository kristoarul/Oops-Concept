trigger LibarayTrigger on Issued_Book__c (before insert,before update,After insert,After update) {
    if(trigger.isbefore && (trigger.isinsert||trigger.isupdate)){
        LibraryHandler.To_Print_Email(trigger.new);
    }
    if(trigger.isAfter && trigger.isUpdate){
     LibraryHandler.To_Count_Book(trigger.old);   
    }
    if(trigger.isAfter && (trigger.isinsert||trigger.isupdate)){
        LibraryHandler.penalty(trigger.new);
        
    }
}