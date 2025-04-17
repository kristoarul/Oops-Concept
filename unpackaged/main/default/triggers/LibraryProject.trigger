trigger LibraryProject on Issued_Book__c (before insert,before update) {
    if(trigger.isbefore &&(trigger.isinsert||trigger.isupdate)){
        
    }
    
    set<id> stuid = new set<id>();
    for(Issued_Book__c iss:trigger.new){
        stuid.add(iss.S_Name__c);
        //select id will be store into 'set'===>stuid
        system.debug('studid=='+stuid);
        
    } 
    map<id,STU__c> stuval = new map<id,STU__c>([select id,S_Name__c,E_mail__c,Mobile_No__c from STU__c where id =:stuid]);
    for(Issued_Book__c iss:trigger.new){
        //get value from matching record
        iss.E_mail__c= stuval.get(iss.S_Name__c).E_mail__c;
        iss.Mobile_No__c= stuval.get(iss.S_Name__c).Mobile_No__c;
        system.debug('aaaa'+ iss.E_mail__c);
        if(iss.Status__c=='Issued'){
            date d=system.today();
            iss.Issued_Date__c=d;
            system.debug('today  date is--->'+system.today());
        }
        
    }
    
    if(trigger.isAfter&&(trigger.isinsert||trigger.isupdate)){
        set<id> bookid = new set<id>(); 
        for(Issued_Book__c is:trigger.new){
            bookid.add(is.B_Name__c);
            system.debug('book_id is===>'+bookid);
        }
    }
    
}