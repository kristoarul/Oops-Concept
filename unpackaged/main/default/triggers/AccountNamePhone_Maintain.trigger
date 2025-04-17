trigger AccountNamePhone_Maintain on Account (before delete) {
    list<Deleted_Records__c> dr = new list<Deleted_Records__c>();
    if(trigger.isbefore && trigger.isdelete){
        for(Account acc : trigger.old){
            Deleted_Records__c dc = new Deleted_Records__c();
            dc.Name = acc.id;
            dc.Phone__c = acc.Phone;
            dr.add(dc); 
        }
        insert dr;
    }
    
}