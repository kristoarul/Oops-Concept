trigger DeleteConcept on Contact (After insert,After update) {
    list<Contact> c = new list <Contact> ();
    if(trigger.isAfter || trigger.isupdate)
    {
                for(Contact con : trigger.new){
                    c=[select id,ContactDelect__c from Contact ];
                    system.debug('hhh'+c);
                }
                        

    }
}