public class myClass {
         public static void testexception(){
        List<Account> listacc=new List<Account>();
        listacc=[Select id,CreatedDate From Account where CreatedDate >today ];
        System.debug('test exception==>'+listacc);
        try{
            if(listacc .size()>0){
                System.debug('no Exception');
            }
        }
        Catch(DMLException e){
            System.debug('exception name===>>'+e.getmessage());
        }
        
    }
    
    
   
    
}