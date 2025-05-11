/**
 * @Author       : Mohammad Arafat Ali
 * @Description  : Test class for PersonAccountHelper class
 * @Date         : 05-11-2025
**/
@isTest
public class PersonAccountHelperTest {

    @isTest
    static void testLogPersonAccountsAsJson() {
        // Step 1: Get the Person Account record type
        RecordType personAccountRT = [
            SELECT Id FROM RecordType 
            WHERE SObjectType = 'Account' 
            AND Name = 'Person Account' 
            LIMIT 1
        ];

        // Step 2: Create test Person Account records
        List<Account> testAccounts = new List<Account>{
            new Account(
                FirstName = 'Test',
                LastName = 'User1',
                RecordTypeId = personAccountRT.Id
            ),
            new Account(
                FirstName = 'Test',
                LastName = 'User2',
                RecordTypeId = personAccountRT.Id
            )
        };
        insert testAccounts;

        // Step 3: Call the method under test
        Test.startTest();
        PersonAccountHelper.logPersonAccountsAsJson();
        Test.stopTest();

        System.assertEquals(2, [SELECT Count() FROM Account WHERE IsPersonAccount = true AND Id IN :testAccounts]);
    }
}