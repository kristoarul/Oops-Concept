public class Simpleprogram1 {
    
    public static void print (List<Account>accList){
        for(account acc:accList ){
            acc.Description='welcome account';
            system.debug('tttttttttttt'+acc.Description);
        }
    }
}