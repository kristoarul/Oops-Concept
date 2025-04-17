trigger deleteError on Account (before delete) {
Set<id> aaa=new Set<id>();
    List<Contact> aa=new List<Contact>();
    for(Account acc:Trigger.old){
        aaa.add(acc.Id);
    }
    aa = [Select id,Name,AccountId from Contact where AccountId =: aaa];
   
    for(Account acc:Trigger.old){
        if(aa.size()>0)
    {
       acc.addError('cant delete');
        
    }
                                }
}