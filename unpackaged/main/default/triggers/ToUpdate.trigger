trigger ToUpdate on Account (before update,after insert,after update) {
    list<Opportunity> opp = new list<Opportunity>();
    list<Opportunity> opp1 = new list<Opportunity>();
    list<id> stop = new list<id>();
    map<id,account> updmap = new map<id,account>();
    if(trigger.isafter && trigger.isinsert){
        for(Account ac :  Trigger.new ){
            if(ac.Rating !='Hot'){
                Opportunity o = new Opportunity();
                o.AccountId = ac.Id;
                o.Name = ac.Name;
                o.CloseDate = system.today();
                o.StageName = 'prospecting';
                //  o.CurrencyIsoCode == 'CurrencyIsoCode';
                opp.add(o);
                system.debug('PPPPPPPPPPPPP'+ opp);
            }
            system.debug('testsesttsefsfwff'+opp);
            insert opp;
        }
        
    }
    if(trigger.isafter && trigger.isupdate){
        for(Account acc : trigger.new){
            stop.add(acc.id);
            updmap.put(acc.id,acc);
            system.debug('PPPPPPPPPPPPP'+ acc);
        }
        if(stop.size()>0){
            for(opportunity opud : ([select id,Name,CloseDate,AccountId,StageName from opportunity where AccountId IN: stop])){
                
                opud.Name = updmap.get(opud.AccountId).Name;
                opud.AccountId = updmap.get(opud.AccountId).id;
                opud.StageName = 'Qualification';
                opp1.add(opud);
            }
            update opp1;
        }
    }
}