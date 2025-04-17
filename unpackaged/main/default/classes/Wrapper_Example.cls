public class Wrapper_Example {
    public Fav_Subject subject {get;set;}   //To Be Value Initialization.
    public list<Fav_Subject> liwrap {get;set;}
    public void pppWrapper_Example(){       //Same value tol use constructor.
        liwrap = new list <Fav_Subject> (); //To_Be Object Creation.
        subject = new Fav_Subject();        // To wrapper class object
        //To be value Initialization for this object.
        subject.book_Name='JAVA';
        subject.book_Authour = 'Mr.james';
        subject.book_Edition = '4th';
        subject.price=555.50;
        liwrap.add(subject);
        System.debug('aaaa'+liwrap);
    }
    public class Fav_Subject{  //It's Wrapper class
        public String book_Name{get;set;}
        public String book_Authour{get;set;}
        public String book_Edition{get;set;}
        public Decimal Price{get;set;}
    }
    
}