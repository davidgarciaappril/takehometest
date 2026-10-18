@isTest
private class OpportunityHelperTest {
    @isTest
    static void testDiscount() {
        Account a = new Account(Name = 'Test', Type = 'Customer - Direct');
        insert a;
        Opportunity o = new Opportunity(Name = 'Opp', AccountId = a.Id,
            StageName = 'Prospecting', CloseDate = Date.today(), Amount = 30000);
        insert o;
        o.StageName = 'Credit Review';
        update o;
    }
}
