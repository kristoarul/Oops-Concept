trigger Associated_Connt on Account (before delete) {
    list <contact> li = new list<contact>();
    set<id> s=new set<id>();
    for(Account a:trigger.old){    
        s.add(a.id);
        system.debug('account id'+s);
    }
 li=[select id,AccountId from contact where Accountid In:s];
    //System.debug('aaa'+li);
        for(Account a:trigger.old){
            if(li.size()>0){
                a.addError('this account associated with contact& Related');
                system.debug('li'+li.size());
            }
        }
    
}