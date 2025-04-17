trigger Throw_Required_Msg on Contact (before insert) {
    for(Contact c:trigger.new)
    {
        if(c.Email==''||c.Email==NULL)
        {
             c.email.addError('THIS E-MAIL FIELD IS REQUIRED');

        }
        if(c.Phone==''||c.Phone==NULL)
        {
            c.phone.addError('THIS PHONE NUMBER FIELD IS REQUIRED ');
        }
        
    }
    
}