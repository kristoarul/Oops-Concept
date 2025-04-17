public class ContactAndLeadSearch {
     public Static LIST<LIST<sObject>> searchContactsAndLeads(String lName)
    {
        LIST<LIST<sObject>> searchList= new  LIST<LIST<sObject>>();
        searchList = [FIND 'Smithh    ' IN ALL FIELDS
                   RETURNING Lead(FirstName,LastName),Contact(FirstName,LastName)];
        return searchlist;

}

}