@isTest
public class LeadBehaviorValidationTest {

    @isTest static void testCheckCountry() {
        //Id recordId = createTestRecord();
        Boolean actual1 = LeadBehaviorValidation.checkCountry('USA');
        System.assert(actual1);
    
        Boolean actual2 = LeadBehaviorValidation.checkCountry('India');
        System.assert(!actual2);
    }
    
     @isTest static void testCheckSource() {
        Boolean checkSource = LeadBehaviorValidation.checkSource('web');
        System.assertNotEquals(true, checkSource);

        Boolean checkSource2 = LeadBehaviorValidation.checkSource('mouth word');
        System.assertNotEquals(false, checkSource2);

    }
}