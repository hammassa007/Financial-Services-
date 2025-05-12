/**
 * @Author       : Mohammad Arafat Ali
 * @Description  : Test class for PersonAccountHelper class
 * @Date         : 05-12-2025
**/
@isTest
public class PersonAccountHelperTest {

    @testSetup
    public static void setupTestData() {
        // Get the Person Account record type
        Id personAccountRTId = Schema.SObjectType.Account.getRecordTypeInfosByDeveloperName().get('PersonAccount').getRecordTypeId();

        // Create test Person Account records
        List<Account> testAccounts = new List<Account>{
            new Account(
                FirstName = 'Test',
                LastName = 'User1',
                RecordTypeId = personAccountRTId
            ),
            new Account(
                FirstName = 'Test',
                LastName = 'User2',
                RecordTypeId = personAccountRTId
            )
        };
        insert testAccounts;
    }

    @isTest
    public static void testLogPersonAccountsAsJson() {
        // Verify test setup
        List<Account> insertedAccounts = [SELECT Id, FirstName, LastName, Name FROM Account WHERE IsPersonAccount = TRUE];
        
        // Execute the method under test
        Test.startTest();
        PersonAccountHelper.logPersonAccountsAsJson();
        Test.stopTest();

        System.assertEquals(2, insertedAccounts.size(), 'Exactly two Person Accounts should exist');
    }
}