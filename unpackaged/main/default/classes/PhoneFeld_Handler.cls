public class PhoneFeld_Handler {
    public static void perform_AfterUpdate(List<Account>newList, Map<Id,Account>oldMapAcc){
        
        Map<Id,Account> AccID = new Map<Id,Account>();
        for(Account acc : newList){
            Account oldAcc=oldMapAcc.get(acc.id);
            
            if(acc.phone != oldAcc.phone){
                AccId.put(acc.id,acc);
                
            }
        }
        
        List<Contact> Con = [SELECT Id, phone, AccountId FROM Contact where AccountId IN : AccId.KeySet()];
        for(Contact c : Con){
            Account acc=AccId.get(c.accountId);
            acc.phone = c.Phone;
            acc.Name = c.LastName;
            
        }
        
        if(Con.size()>0 && Con != null){
            update Con;
        }
    }
}