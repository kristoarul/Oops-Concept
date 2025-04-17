public class ap implements Queueable {
    public void execute(QueueableContext context) {
        Account a = new Account(Name='Selva mumbai',Phone='(415) 555-1212');
        insert a;
system.debug(''+a);        
    }
}