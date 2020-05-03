@isTest
public class LeadBehaviorResourceTest {

    @isTest static void testCreateLeadBehavior(){
        
        Id leadResourceId = LeadBehaviorResource.postLeadById('Test', 'lead', 'Web', 'North Carolina', 'Carolina', 'USA','123 street', false,
                                                              false, 'Health Insurance', '', 'chuechk', 'test@mail.com', '5685648134'); 
        System.assert(leadResourceId!= null);
        lead_Behaviour__c lb =[Select Id, Last_Name__c, Country__c from Lead_Behaviour__c where Id =: leadResourceId];
        System.assert(lb!=null);
        System.assertEquals(lb.Country__c, 'USA');
    

        Id leadResourceId2 = LeadBehaviorResource.postLeadById('Test1', 'lead1', 'Web', 'North Carolina', 'Carolina', 'India','12ds street', false,
                                                                false, 'Health Insurance', '', 'chuechk', 'test@mail.com', '5685648134'); 
        System.assert(leadResourceId2 == null);
        RestResponse res = new RestResponse();
        System.assertEquals(res.statusCode, 400);

        Id leadResourceId3 = LeadBehaviorResource.postLeadById('Test3', 'lead3', 'word of mouth', 'North Carolina', 'Carolina', 'Usa','12ds street', false,
                                                                false, 'Health Insurance', '', 'chuechk', 'test@mail.com', '5564573'); 
        System.assert(leadResourceId2 == null);
        RestResponse res1 = new RestResponse();
        System.assertEquals(res1.statusCode, 400);

        Id leadResourceId4 = LeadBehaviorResource.postLeadById('Test3', 'lead3', 'Web', 'North Carolina', 'Carolina', 'Usa','12ds street', false,
                                                                false, 'Health Insurance', '', 'chuechk', 'test@mail.com', '5564573'); 
        System.assert(leadResourceId4!=null);
        lead_Behaviour__c lb2 =[Select Id, Last_Name__c, Country__c from Lead_Behaviour__c where Id =: leadResourceId];
        System.assert(lb2!=null);
        System.assertEquals(lb.Lead_Source__c, 'Web');
    }

    @isTest static void testGetLeadBehavior(){
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        RestResponse response = new RestResponse();
        RestContext.request= request;
        RestContext.response = response;
        request.requestUri =
            'https://https://ap16.lightning.force.com//services/apexrest//LeadBehavior/'+ recordId;

        request.httpMethod = 'GET';
        Lead_Behaviour__c thisLb = LeadBehaviorResource.getLeadByParams();
        System.assert(thisLb!=null);
        System.assertNotEquals(thisLb.FirstName__c, 'Test record');


    }

    //helper method
    static Id createTestRecord() {
        // Create test record
        Lead_Behaviour__c lbTest = new Lead_Behaviour__C(
           FirstName__c='Test record',
            Last_Name__c='New record',
           Lead_Source__c='web',
            Country__c='USA');
        insert lbTest;
        return lbTest.Id;
   
}
}
