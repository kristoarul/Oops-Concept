trigger Account_Delete on Account (before delete)
{
        for(Account ac:[select id from Account where id In(select Accountid from contact)and id In : trigger.oldMap.keyset()])
        {
            trigger.oldMap.get(ac.id).addError('cant be deleted');
        }
       
         
      
}