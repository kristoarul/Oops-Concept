trigger Addamount on Account (before insert,before update) {
   if(trigger.isbefore&&(trigger.isinsert||trigger.isupdate)){
        for(Account acc:trigger.new){
            if(acc.Industry=='Banking'){
                acc.AnnualRevenue=1000000;     
            }
           else if(acc.Industry=='HealthCare'){
                acc.AnnualRevenue=70000;   
            }
            else if(acc.Industry=='Manufacturing'){
                acc.AnnualRevenue = 60000;
            }
            else if(acc.Industry=='Income'){
                acc.AnnualRevenue = 50000;
            }}}}