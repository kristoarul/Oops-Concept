trigger To_Print_OwnerName on Contact (before insert,before update) {
       for(Contact con:trigger.new)
    {
       con.Description= UserInfo.getName();
        system.debug('==1234567890=='+date.today().format());
        
             }
    

}