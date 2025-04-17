trigger Condiscription on Contact (After update) {
    for(contact con:trigger.new){
        
      con.discription__c='this contact is inserted';
    }
}