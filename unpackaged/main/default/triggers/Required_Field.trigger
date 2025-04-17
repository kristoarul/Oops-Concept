trigger Required_Field on Lead (before insert) {
    for(Lead l:trigger.new)
    {
        if(l.Email==''||l.Email==NULL)
        {
             l.email.addError('This Email is a required field');

        }
       else if(l.Phone==''||l.Phone==NULL)
        {
            l.phone.addError('this Phone number is required field ');
        }   
        else
        {
            System.debug('Successfully completed');
        }

    }
}