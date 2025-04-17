trigger Simpletest on Account (before insert, before update) {
    
    if(trigger.isbefore && trigger.isinsert)
        
         {
            Simpleprogram1.print(trigger.new);
        }
    
    
       
  
}