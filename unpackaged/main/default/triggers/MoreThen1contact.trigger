trigger MoreThen1contact on Contact (before insert) {
    Set<Id> setofAccountId = new Set<Id>();
    for(Contact con : trigger.new)
        setofAccountId.add(con.Accountid);
    system.debug('To set of acc id'+setofAccountId);
    Map<Id,Account> mapAccIdToContacts = new Map<Id,Account>([Select Id,(Select Id From Contacts) From Account Where Id IN : setofAccountId]);
    for(Contact con1 : trigger.new){
        if(mapAccIdToContacts.containskey(con1.AccountId) && mapAccIdToContacts.get(con1.AccountId).Contacts.size() > 1)
            con1.addError('YOU CANNOT HAVE ADD MORE THAN 1 CONTACTS PER THIS ACCOUNT');
    }
    
    
}