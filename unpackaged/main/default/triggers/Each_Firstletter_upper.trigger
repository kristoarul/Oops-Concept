trigger Each_Firstletter_upper on Account (before insert,before update) {
    String Comp;
    Integer NumberOfWords;
    List<String> words;
    String CompanyShort='';
    for(Account ac : trigger.new){
        Comp = ac.Name;
        Comp = Comp.toUpperCase();
        words = Comp.split('\\s+');
        NumberOfWords = words.size();
        for(integer i = 0; i < NumberOfWords; i++){
            CompanyShort += words[i].substring(0,1);
            system.debug('Company_Short is ===>'+CompanyShort);
        }
        if(CompanyShort != null){
            ac.Name= CompanyShort;
        }
    }   
}