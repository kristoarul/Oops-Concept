trigger ConvertedLead on Lead (After insert) {
    if(trigger.isAfter && trigger.isInsert){
        list <Account> a = new list<Account>();
        List<Contact> c = new list<Contact>();
        list<Opportunity> op = new list<Opportunity>();
        for(Lead l : trigger.new){
            if(l.IsConverted==true){
                if(l.ConvertedAccountId !=Null){
                    Account acc=[select id,name,Email__c from Account WHERE id =: l.ConvertedAccountId];
                    System.debug('test===>'+acc);
                    acc.Name=l.Name;
                    acc.Phone = l.Phone;
                    acc.Email__c=l.Email;
                 a.add(acc);
                }
                update a;
            }
            if(l.ConvertedContactId !=NULL){
                Contact con=[select id,LastName from Contact WHERE id =:l.ConvertedContactId];
                con.LastName = l.Name;
                con.Phone = l.Phone;
                con.Email = l.Email;
               c.add(con);
            }
            update c;
        if(l.ConvertedOpportunityId !=NULL){
            Opportunity opp=[select id,name from Opportunity WHERE id =:l.ConvertedOpportunityId];
            opp.Name = l.Name;
            opp.Phone__c = l.Phone;
            opp.Email__c = l.Email;
            op.add(opp);
        }
        update op;
    }
    }
}