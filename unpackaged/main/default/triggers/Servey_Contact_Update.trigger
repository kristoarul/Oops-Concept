trigger Servey_Contact_Update on Survey__c (After insert) {
    List<Contact> Clist = new List<Contact>();
    List<Survey__c> Sid = new List<Survey__c>();
    List<id> Cid = new List<id>(); 
    
    if(trigger.isafter && trigger.isinsert)
    {
        for(Survey__c s : Trigger.new)
        {
            Cid.add(s.Contact__c);
            Sid.add(s);
        }
        
        map<id,Contact> conData=new map<id,Contact>([Select id,survey_submit_date__c from Contact where id in: Cid]);
        map<id,Survey__c> surdata=new map<id,Survey__c>([Select id,Contact__c,servey_id__c,Survey_Created_Date__c from Survey__c where id IN: Sid]);
        
        for(Survey__c s : Sid )
        {
            if(s.Name == 'Survey 1')
            {
                contact c = new contact();
                c.Id = surdata.get(s.Id).Contact__c;
                c.sles_servey_id__c = surData.get(s.Id).servey_id__c;
                c.survey_submit_date__c = surData.get(s.id).Survey_Created_Date__c;
                Clist.add(c);
            }
        }
        update Clist;
    }
}