public class LeadBehaviorValidation {
    
    public static Boolean checkCountry (String countryName) {
        if (countryName!=null && countryName=='USA') {
            return true;
        }
        return false;
    }

    public static Boolean checkSource(String source) {
        List<String> sourceValuesList= new List<String>();
        Schema.DescribeFieldResult fieldResult = Lead_Behaviour__c.Lead_Source__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            sourceValuesList.add(pickListVal.getLabel());
        }    

        for(String src:sourceValuesList){
            if(source!=null && src==source){
                return true;
            }
        }
        return false;
    }

}