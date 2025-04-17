trigger Duplicate_Email_Error on Lead (before insert,before update) {
    map<String,lead> l =new map<String,lead>();
    for(Lead li:trigger.new){
        if((li.Email != null) && (Trigger.isInsert || (li.Email == trigger.oldMap.get(li.id).Email))){
            if(l.ContainsKey(li.Email)){
                li.Email.addError('Another new lead has the' + ' same email address');
                
            }
            else {
                l.put(li.Email, Li);
            }
        }
    }
    for(Lead li : [SELECT Email FROM Lead WHERE Email IN : l.keySet()]){
        Lead newLead = l.get(li.Email);
        if(l.size()>0){
            system.debug('**************'+li);
            li.Email.addError('A lead Object this email address already exists.If you want to store valid email');
        }
    }    
}