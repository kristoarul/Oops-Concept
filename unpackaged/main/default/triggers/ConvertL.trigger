trigger ConvertL on Lead (After insert) {
    LeadStatus convertStatus = [Select MasterLabel from LeadStatus where IsConverted = true limit 1];
    System.debug('test---->'+convertStatus);
    List<Database.LeadConvert> leadConverts = new List<Database.LeadConvert>();
    ID convertedAccId,convertedContactId,convertedOpportunityId;
    Map<Id,Lead> accmap=new Map<Id,Lead>();
    Map<Id,Lead> conmap=new Map<Id,Lead>();
    Map<Id,Lead> oppmap=new Map<Id,Lead>();
    list<id> leadid=new list<id>();
    List<Account> accupdate=new List<Account>();
    List<Contact> conupdate=new List<Contact>();
    List<Opportunity> oppupdate=new List<Opportunity>();
    for (Lead le: Trigger.new) {
        if(trigger.isAfter && trigger.isInsert){
            if(le.Email !='' && le.Email !=null && le.Phone !='' && le.Phone !=''){
                System.debug('testemail'+le.Email);
                if (!le.isConverted) {
                    Database.LeadConvert lc = new Database.LeadConvert();
                    System.debug('testconvert---->'+lc);
                    leadid.add(le.id);          
                    String opportunityName = le.Name;
                    String accountname = le.Name;
                    string contactname = le.Name;
                    lc.setLeadId(le.Id);
                    lc.setAccountId(accountname); 
                    lc.setOpportunityName(opportunityName);
                    lc.setConvertedStatus(convertStatus.MasterLabel);
                    leadConverts.add(lc);
                    System.debug('yyyy'+leadConverts);
                }
            }
            if (!leadConverts.isEmpty()) {
                if(leadConverts.size()>0){
                    List<Database.LeadConvertResult> lcr = Database.convertLead(leadConverts);
                    for(lead l:[SELECT Id,ConvertedOpportunityId,Name,Phone,Email,ConvertedAccountId,ConvertedContactId FROM Lead WHERE Id =: leadid]){
                        convertedAccId = l.ConvertedAccountId;
                        convertedContactId = l.ConvertedContactId;
                        convertedOpportunityId =l.ConvertedOpportunityId;
                        accmap.put(convertedAccId,l);
                        conmap.put(convertedContactId,l);
                        oppmap.put(convertedOpportunityId,l);
                        
                    }
                    if(convertedAccId != null){
                        Account acc = new Account();
                        acc.Id = convertedAccId;
                        acc.Name = accmap.get(convertedAccId).Name;
                        acc.Email__c = accmap.get(convertedAccId).Email;
                        acc.Phone = accmap.get(convertedAccId).Phone;
                        accupdate.add(acc);
                    }
                    update accupdate;
                    if(convertedContactId !=null){
                        Contact con = new Contact();
                        con.Id = convertedContactId;
                        con.LastName = conmap.get(convertedContactId).Name;
                        con.Phone = conmap.get(convertedContactId).Phone;
                        con.Email = conmap.get(convertedContactId).Email;
                        conupdate.add(con);
                    }
                    update conupdate;
                    if(convertedOpportunityId !=null){
                        Opportunity opp =new Opportunity();
                        opp.Id = convertedOpportunityId;
                        opp.Name=oppmap.get(convertedOpportunityId).Name;
                        opp.Phone__c = oppmap.get(convertedOpportunityId).Phone;
                        opp.Email__c = oppmap.get(convertedOpportunityId).Email;
                        oppupdate.add(opp);
                    }
                    update oppupdate;
                }
            }
        }
        
    }
}