trigger LatestContact on Contact (After insert) {
    set<id> set1 = new set<id>();
    List<Account> acc = new List<Account>();
    system.debug('hh'+acc);
    if(trigger.isAfter && trigger.isInsert ){
        for(Contact con : trigger.new){
            set1.add(con.Id);
            
        }
        ///LIST CONCEPT/////
        /*  List<Contact> list1 = new  List<Contact>([select id,Name,AccountId,Account.Name from Contact where Id =:set1]);
List<Account> acc2 = new List<Account>();
System.debug('hhhh'+list1);
if(list1.size()>0){
for(Contact co :list1){
for(Contact con1:Trigger.new){
Account acc1= new Account();
acc1.Id=con1.AccountId;
acc1.Name =co.Account.Name;
acc1.Contact_Name__c = co.Name;
acc1.Created_Date__c = con1.CreatedDate;
acc2.add(acc1);

}

System.debug('eeer'+acc2);
}
}
update acc2;
*/        
        ///MAP CONCEPT////
        Map<id,Contact> map1 = new  Map<id,Contact>([select id,Name,AccountId,Account.Name from Contact where Id =:set1]);
        List<Account> acc1 = new List<Account>();
        System.debug('hhhh'+map1);
        if(map1.size()>0){
            for(Contact con:trigger.new){
                Account acc=new Account();
                acc.id=con.AccountId;
                acc.Name=map1.get(con.id).Name;
                acc.Contact_Name__c=con.id;
                acc.Created_Date__c=con.CreatedDate;
                acc1.add(acc);
            }
            System.debug('eeer'+acc1);
           update acc1; 
            }
        }
         
    }