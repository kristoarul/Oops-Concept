public class LibraryHandler {
    public static void To_Print_Email(list <Issued_Book__c> li){
        set<id> stuid = new set<id>();
        for(Issued_Book__c iss:li){
            stuid.add(iss.S_Name__c);
            //select id will be store into 'set'===>stuid
            system.debug('studid=='+stuid);            
        }
        map<id,STU__c> stuval = new map<id,STU__c>([select id,S_Name__c,E_mail__c,Mobile_No__c from STU__c where id =:stuid]);
        for(Issued_Book__c iss:li){
            //get value from matching record
            iss.E_mail__c= stuval.get(iss.S_Name__c).E_mail__c;
            iss.Mobile_No__c= stuval.get(iss.S_Name__c).Mobile_No__c;
            system.debug('aaaa'+ iss.E_mail__c);
            if(iss.Status__c=='Issued'){
                iss.Issued_Date__c=system.today();
                iss.Return_date__c=system.today()+7; 
                system.debug('today  date is--->'+system.today());
            }
        }
    }
    public static void penalty(list <Issued_Book__c> li){
        for(Issued_Book__c iss:li){
            if(iss.Status__c=='Return' && (iss.Return_Date__c > iss.Issued_Date__c)){
                Integer s = iss.Return_Date__c.daysBetween(iss.Issued_Date__c);
                iss.Penalty__c = s*10;
                system.debug('ssssss'+s);
                System.debug('days count'+iss.Penalty__c);
            }
        }
    }
    public static void permit(list<STU__c> li){   
        
    }
    public static void To_Count_Book(list <Issued_Book__c> li){
        list <String> Book = new list <String> (); 
        set<id> bookid = new set<id>(); 
        for(Issued_Book__c iss1:li){
            bookid.add(iss1.B_Name__c);    
            system.debug('book_id is===>'+bookid);
        }
    }
}