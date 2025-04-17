trigger AllContactDelete on Contact (After insert,After update) {
    list<Contact> c = new list<Contact>();
    list<Object1__c> l = new list <Object1__c>();
    if(trigger.isAfter && trigger.isinsert){
        for(Contact con:trigger.new){
            Object1__c o = new Object1__c();
            o.Id = con.AccountId;
            o.Name = con.LastName;
            o.Contact__c = con.Id;
            l.add(o);
        }
        insert l;
    }
    if(trigger.isAfter && trigger.isupdate){
        for(Contact con:trigger.new){
            if(con.ContactDelect__c == true){
                      c.add(con);
            }
          
            l=[select id from Object1__c WHERE Contact__c IN : c ];
        }
        delete l;
    }
    
}