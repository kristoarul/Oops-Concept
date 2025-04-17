trigger To_Relation on Account (before insert ,After insert) {
    list<contact> con = new list<contact>();
    if(Trigger.isInsert && Trigger.isAfter){
    for(Account ac:trigger.new ){
        if(ac.Name.startsWith('QRS')){
            contact c = new contact();
            c.AccountId=ac.Id;
            c.LastName=ac.Name;
            c.Email=ac.Email__c;
            con.add(c);
        }
    }
insert con;
    }
}