/**
 * Created by rdeepika on 4/13/20.
 */

trigger LeadBehaviourTask on Lead_Behaviour__c (after insert) {

List<Task> taskList = new List<Task>();
    for(Lead_Behaviour__c lead:Trigger.new){
        if(lead.Checked_on_Campaigns__c=true&&lead.Email__c!=null) {
            Task task = new Task();
            task.Subject = 'Call';
            taskList.add(task);
        }
    }
    insert taskList;
}