public class NewCaseListController {
    public list<Case> getNewCases(){
        List<Case> cases = [select Id,CaseNumber from Case where status = 'New'];
        return cases;
    }
    
}