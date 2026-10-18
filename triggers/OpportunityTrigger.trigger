trigger OpportunityTrigger on Opportunity (before update, after update) {
    if (Trigger.isBefore) {
        OpportunityHelper.applyDiscount(Trigger.new);
    }
    if (Trigger.isAfter) {
        OpportunityHelper.markForReview(Trigger.new);
    }
}
