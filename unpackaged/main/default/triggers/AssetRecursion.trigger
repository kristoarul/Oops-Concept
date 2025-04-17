trigger AssetRecursion on Contact (After insert,After update) {
    if(Trigger.isAfter &&(Trigger.isInsert ||Trigger.isUpdate)){
        // AssetRecursiveStopping1.isRecursive = false;
        Map<Id,Contact> mapcon = new Map<Id,Contact>();
        List<Sales_Backlog__c> upsales=new List<Sales_Backlog__c>();
        List<Service_Backlog__c> UpSer=new List<Service_Backlog__c>();
        for(Contact con:Trigger.new){
            if(con.ERA_customer_ID__c!=null && con.Vin_Number__c!=null){
                List<Sales_Backlog__c> salList=[select id,VoID__c,ERA_customer_ID__c,VIN__c FROM Sales_Backlog__c Where ERA_customer_ID__c=:con.ERA_customer_ID__c AND VIN__c=:con.Vin_Number__c];
                if(salList.size()>0){
                    for(Sales_Backlog__c ss:salList){
                        ss.VoID__c=con.Id;
                        upsales.add(ss);
                    }
                }
                List<Service_Backlog__c> serList=[select id,Vo_Id__c,ERA_customer_ID__c,VIN__c FROM Service_Backlog__c Where ERA_customer_ID__c=:con.ERA_customer_ID__c AND VIN__c=:con.Vin_Number__c];
                system.debug('serList'+serList);
                if(serList.size()>0){
                    for(Service_Backlog__c se:serList){
                        se.Vo_Id__c=con.Id;
                        UpSer.add(se);
                    }
                }
            }
        }
        if(UpSer.size()>0){
            update UpSer;
            //ServiceRecursiveStopping.isRecursive = True;
        }
        if(upsales.size()>0){
            update upsales;
        }
    }
    
}