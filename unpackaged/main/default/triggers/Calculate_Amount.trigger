trigger Calculate_Amount on Contact (before insert,After insert,before update,After delete) {
    Set<String> setEmailID = new set<String>();
    Set<Id> setContID = new set<ID>();
    
    List<Contact> conold=trigger.old;
    //Get The coursedetails__c value related contact cource 
    List<String> amountlist=new List<String>();
    List<Course_Details__c> courseList=new List<Course_Details__c>();
    System.debug('old values'+conold);
    if(trigger.isAfter && trigger.isdelete){
        system.debug('delete');
        List<Delete_Record_Maintain__c> lstToInsrt = new List<Delete_Record_Maintain__c>(); 
        
        for(Contact deletedAcc :trigger.old)
        {
            system.debug('deletedAcc '+deletedAcc );
            Delete_Record_Maintain__c backup = new  Delete_Record_Maintain__c();
            backup.Name = deletedAcc.name;
            backup.Email__c = deletedAcc.Email;
            lstToInsrt.add(backup);
            system.debug('backup '+backup);
        }
        if(lstToInsrt.size()>0)
        {
            insert lstToInsrt;
            system.debug('list'+lstToInsrt);
        }
    }
    
    if(trigger.isbefore && trigger.isinsert){
        for (Contact Contact : Trigger.new) 
        {
            if ((Contact.Email != null) &&  (Trigger.isInsert ||  (Contact.Email != Trigger.oldMap.get(Contact.Id).Email))) 
            {
                System.debug('accepted');
                
                setEmailID.add(Contact.Email);
                setContID.add(Contact.id);
            }
        }    
        List<Contact> lstCOntact = [select id ,email from contact where email in :setEmailID and id not in :setContID ];
        Map<String, Contact> contactMap = new Map<String, Contact>();
        System.debug('Hi====>'+lstCOntact);
        
        for(Contact cont : lstCOntact)
        {
            contactMap.put(cont.email, cont);
        }   
        
        for (Contact Contact :Trigger.new) 
        {
            if ((Contact.Email != null) &&  (Trigger.isInsert ||  (Contact.Email !=Trigger.oldMap.get(Contact.Id).Email))) 
            {
                if(contactMap.containsKey(Contact.Email))
                {
                    Contact.Email.addError('A Contact with this email address already exists.');
                }
            }   
        }
    }
    
    
    for(Contact cn:trigger.new){
        amountlist.add(cn.Select_Course__c);
    }
    courseList=[select id,amount__c,Select_Course__c from Course_Details__c where Select_Course__c IN:amountlist] ;
    System.debug('coaurse List'+courseList);
    for(Course_Details__c cs:courseList){
        for(Contact con:Trigger.new){
            System.debug('amount'+cs.amount__c);
            con.Remainter_Balance__c =con.Initial_Amount__c-cs.amount__c;
            System.debug('amount'+ con.Remainter_Balance__c);
        }
    }
    
    if(trigger.isAfter && trigger.isInsert)
    {
        set<id> ContactId = new set<id>();
        
        // Step 0: Create a master list to hold the emails we'll send
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        
        for (Contact myContact : Trigger.new) {
            
            if (myContact.Email !=null )
            {
                ContactId.add(myContact.Email);
            }
            Contact con = [Select firstname,lastname,email,id,name,MobilePhone from Contact where id in :ContactId];
            // Step 1: Create a new Email
            Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
            
            // Step 2: Set list of people who should get the email
            List<String> sendTo = new List<String>();
            sendTo.add(con.email);
            mail.setToAddresses(sendTo);
            // Step 4. Set email contents - you can use variables!
            mail.setSubject('URGENT BUSINESS PROPOSAL');
            String body = 'Dear ' + con.FirstName;
            
            mail.setHtmlBody(body);
            
            // Step 5. Add your email to the master list
            mails.add(mail);
            Messaging.sendEmail(mails);
        }
    }
    
    
    
}