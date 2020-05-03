global class LeadPhoneValidation implements Database.Batchable<SObject> {

    List<String> phonesList = new List<String>();

    global Database.QueryLocator start(Database.BatchableContext bc) {
       String query = 'Select Id, Name, Email, Phone from Lead';
        return Database.getQueryLocator('query');
    }

    global void execute(Database.BatchableContext bc, List<Object> scope){
        for(Object obj : scope){
            Lead ld = (Lead) obj;
            if(String.isBlank(ld.Phone)){
                phonesList.add(ld.Phone);
            }
        }
    }

    global void finish(Database.BatchableContext bc){
        
        if(phonesList.size()>0){
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setPlainTextBody('Leads that are having empty phone fields are'+phonesList.size());
        list<String> sendTo = new List<String>{'xyz@gmail.com'};
        mail.setToAddresses(sendTo);
        mail.setSubject('Lead Data Validation');
        list<String> cC = new List<String>{'trav@lm.com'};
        mail.setCcAddresses(cC);
        mails.add(mail);
        Messaging.sendEmail(mails);
        }
        Id batchJobId =Database.executeBatch(new LeadPhoneValidation(),2);
    }
    
}