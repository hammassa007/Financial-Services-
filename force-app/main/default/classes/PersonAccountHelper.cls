/**
 * @Author       : Mohammad Arafat Ali
 * @Description  : Apex class to show Person Account Id as Key
 *               : and Person Account Record as Value of a map in Debug
 * @Date         : 05-12-2025
**/
public without sharing class PersonAccountHelper {
    public static void logPersonAccountsAsJson() {
        try{
            Map<Id, Account> accountMap = new Map<Id, Account>();
            for (Account acc : [SELECT Id, FirstName, LastName, Name FROM Account WHERE IsPersonAccount = true]) {
            accountMap.put(acc.Id, acc);
        }
            System.debug('Person Account Map: ' + JSON.serializePretty(accountMap));            
        }
        catch (Exception e) {
            System.debug('Error occurred while retrieving Person Accounts: ' + e.getMessage());
            System.debug('Stack Trace: ' + e.getStackTraceString());
        }
    }
}