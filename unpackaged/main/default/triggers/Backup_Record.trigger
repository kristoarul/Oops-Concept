trigger Backup_Record on Account (after delete) {
 if(trigger.isDelete && trigger.isAfter)
 {
  List<My_Backup__c> lstToInsrt = new List<My_Backup__c>();  
  for(Account deletedAcc : trigger.old)
  {
   system.debug('deletedAcc '+deletedAcc );
   My_Backup__c backup = new My_Backup__c();
   backup.Name = deletedAcc.name;
   lstToInsrt.add(backup);
   system.debug('backup '+backup);
  }
  if(lstToInsrt.size()>0)
  {
   insert lstToInsrt;
   system.debug('list'+lstToInsrt);
  }
 }

}