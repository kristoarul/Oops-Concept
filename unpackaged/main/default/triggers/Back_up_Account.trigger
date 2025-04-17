trigger Back_up_Account on Account (After insert) {
    List<BackupAccount__c> aa=new List<BackupAccount__c> ();
    for(Account ac:trigger.new){
          System.debug('aa1'+ac);
    
        BackupAccount__c b=new BackupAccount__c();
        b.AccountName__c=ac.Name;
        b.Account_Number__c=ac.AccountNumber;
        b.AnnualRevenue__c=ac.AnnualRevenue;
        aa.add(b);
        System.debug('aa'+aa);
    }
    Insert aa;
}