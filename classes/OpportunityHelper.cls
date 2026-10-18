public without sharing class OpportunityHelper {

    public static void applyDiscount(List<Opportunity> opps) {
        for (Opportunity o : opps) {
            if (o.StageName == 'Credit Review') {
                Account a = [SELECT Id, Type FROM Account
                             WHERE Id = :o.AccountId];
                if (a.Type == 'Customer - Direct' && o.Amount > 20000) {
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
                update toUpdate;
            }
        }
    }
}
