@RestResource(UrlMapping='/LeadBehavior/*')
global with sharing class LeadBehaviorResource {

    @HttpPost
    global static Id postLeadById (String FirstName, String LastName, String LeadSource, String State, String City,
                                    String Country, String StreetAddress, Boolean FilledInEnquiryForm,
                                    Boolean CheckedOnCampaigns, String ProductsInterested, String OthersPleaseSpecify,
                                    String Comments, String Email, String Phone) {

        Lead_Behaviour__c lead = new Lead_Behaviour__c (
            
        FirstName__c = FirstName,
        Last_Name__c = LastName,
        Lead_Source__c = LeadSource,
        State_Province__c =State,
        City__c =City,
        Country__c =Country,
        Street_Address__c = StreetAddress,
        Filled_In_Enquiry_Form__c= FilledInEnquiryForm,
        Checked_on_Campaigns__c = CheckedOnCampaigns,
        Products_Interested__c = ProductsInterested,
        Others_Please_Specify__c = OthersPleaseSpecify,
        Comments_Feedback__c = Comments,
        Email__c = Email,
        Phone__c = Phone);
    
        Boolean countryResult = LeadBehaviorValidation.checkCountry(lead.Country__c);
        if (countryResult== false) {
                //lead.addError('This is available only in USA');
                RestResponse response = new RestResponse();
                if(response.statusCode==400){
                response.responseBody = Blob.valueOf('This is available only in USA');
            }
            }

        Boolean sourceResult = LeadBehaviorValidation.checkSource(lead.Lead_Source__c);
        if(sourceResult==false) {
                //lead.addError('The values must be picklist values');
                RestResponse response = new RestResponse();
                if(response.statusCode==400){       
                response.responseBody = Blob.valueOf('This is available only in USA');
            }
        }
           
        Insert lead;
        return lead.Id;
    }

    @HttpGet
    global static Lead_Behaviour__c getLeadByParams() {
        RestRequest req = RestContext.request;

        Map<String, String> params = req.params;
        String lastName = params.get('LastName');
        String leadId = params.get('Id');
        
        Lead_Behaviour__c leadBehavior = [Select Id, Last_Name__c from Lead_Behaviour__c where Id =: leadId];

        return leadBehavior;
    }

}
