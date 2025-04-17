trigger Prevent on Account (before delete) {
    for(Account acc:trigger.old){
        if(acc.Active__c=='yes'){
            acc.addError('THIS ACCOUNT IS ACTIVE SO CANNOT BE DELETED');
        }
    }

}