trigger AssociateUpdateField on Contact (After insert,after update) {
    List<account> li=new list<Account>();
    set<Id> ids = new set<Id>();
    for(Contact c: trigger.new)
        ids.add(c.AccountId);
    Map<Id, Account> accountMap = new Map<Id, Account>([Select Id, Phone from Account Where Id In :ids]);
    for(Contact c: trigger.new)
    {
        Account a = accountMap.get(c.AccountId);
        system.debug('Account map Value===>'+a);
        if(a != null)
        {
          system.debug('Account map Value12===>'+a);
            a.Phone= c.MobilePhone;
            li.add(a);
        }
    }
    System.debug('update value==>'+li);
    update li;
}