/**
 * @Author       : Mohammad Arafat Ali
 * @Description  : Apex class to show Person Account Id as Key
 *               : and Person Account Record as Value of a map in Debug
 * @Date         : 05-11-2025
**/
public without sharing class PersonAccountHelper {
    public static void logPersonAccountsAsJson() {
        List<Account> accounts = [SELECT Id, FirstName, LastName, Name FROM Account WHERE IsPersonAccount = true];
        Map<Id, Account> accountMap = new Map<Id, Account>();
        for (Account acc : accounts) {
            accountMap.put(acc.Id, acc);
        }
        System.debug(JSON.serializePretty(accountMap));
    }
}