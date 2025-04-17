trigger PreviousDateUpdate on Contact (before update) {
    List<Contact> con = new List<Contact>();
    String preval;
    Date dt;
    for(Contact con1 : trigger.new){
        if(Trigger.oldMap.get(con1.Id).NextServiceDate__c != NULL){
            dt = trigger.oldMap.get(con1.Id).NextServiceDate__c;
            preval = dt.format();
            con1.PreviousDateValue__c = con1.PreviousDateValue__c+','+ preval;
            System.debug('Check data'+con1);
            con.add(con1);
        }  
    }
}