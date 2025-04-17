trigger LeadConvertToAccont on Lead (After insert,After update) {
    List<Database.LeadConvert> DLC = new List<Database.LeadConvert>();
    Account acc  = new Account ();
    Contact con = new Contact();
    Opportunity opp = new Opportunity();
    for(Lead l : trigger.new){
        if(l.Email==''||l.Email==NULL &&l.Name==''||l.Name==NULL && l.Phone==''||l.Phone==NULL){
            if(l.IsConverted){
                system.debug('Lead Email is '+l.Email);
                System.debug('Lead Name is '+l.Name);
                System.debug('Lead Phone is '+l.Phone);
                 Database.LeadConvert Leadconvert = new Database.LeadConvert();
                    LeadStatus Leads= [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted =true LIMIT 1];
                    Leadconvert.setConvertedStatus(Leads.MasterLabel);
                    Leadconvert.setLeadId(l.id);
                    String accname = l.Name;
                    Leadconvert.setAccountId(accname);
                    acc.Name =l.Name;
                    Leadconvert.setAccountId(l.id);
                    Leadconvert.setContactId(l.Id);
                    Leadconvert.setOpportunityId(l.Id);
                    Leadconvert.setOpportunityName(accname);
                    DLC.add(Leadconvert);
            }
        }
        if (!DLC.isEmpty()) {
        List<Database.LeadConvertResult> lcr = Database.convertLead(DLC);
        } 
    }
}