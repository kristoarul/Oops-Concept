trigger Contact_type on Contact (before insert) {
    set<id> s =new set<id>();
    for(contact con:trigger.new){
        if(con.AccountId !=NULL){
            s.add(con.AccountId);
            System.debug('Set value is'+S);
        }
    }
        map<id,Account> m =new map<id,Account>([select id,type from Account where id in:s]);
System.debug('Thw Map value is--->'+m);
        for(contact c:trigger.new){
            if(c.AccountId !=NULL&&m.containskey(c.AccountId)){
               C.Account_Type__c=m.get(c.AccountId).type;
                System.debug('the Account ype is'+C.Account_Type__c);
            }
        }
    }