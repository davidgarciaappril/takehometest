public without sharing class OpportunityHelper {               // [F2] without sharing sin justificación

    public static void applyDiscount(List<Opportunity> opps) {
        for (Opportunity o : opps) {
            if (o.StageName == 'Credit Review') {               // [F3] magic string
                Account a = [SELECT Id, Type FROM Account
                             WHERE Id = :o.AccountId];         // [F4] SOQL en loop
                if (a.Type == 'Customer - Direct' && o.Amount > 20000) {  // [F5] null pointer si Amount es null
                    o.Discount__c = 2;
                }
            }
        }
    }

    public static void markForReview(List<Opportunity> opps) {
        for (Opportunity o : opps) {
            if (o.StageName == 'Credit Review') {
                Opportunity toUpdate = new Opportunity(Id = o.Id);
                toUpdate.Description = 'Sent to review on ' + System.today();
                update toUpdate;                                 // [F6] DML en loop + [F7] recursión del trigger
            }
        }
    }
}
