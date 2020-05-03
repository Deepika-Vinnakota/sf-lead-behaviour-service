@isTest
public  class LeadDataCheckHandlerScheculeTest {
    @isTest static void  LeadDataCheckHandlerScheculeTest() {



    }


    //Helper Method
    static void createTestRecord() {
        // Create test record
        Lead leadTest1 = new Lead(
           FirstName='Test record1',
            LastName='New Test record1',
           Phone='0bsfd76455422',
           Status ='Open - Not Contacted');
        insert leadTest1;

        Lead leadTest2 = new Lead(
           FirstName='Test record2',
            LastName='New Test record2',
           Status ='Open - Not Contacted');
        insert leadTest2;
        return;
}
}