trigger MapExample on Lead (before insert) {
    map<integer,String> m =new map<integer,String>();
    for(Lead l:trigger.new){
           //putmethod.
    m.put(101,'ram');
    m.put(102,'raja');
    m.put(103,'ram');
          //getmethod
    system.debug('output is'+m.get(102));
    system.debug('output is'+m.get(103));
        
    }

}