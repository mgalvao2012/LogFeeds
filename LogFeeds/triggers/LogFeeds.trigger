trigger LogFeeds on FeedItem (after update, before delete) {
    Log_Feed__c[] ListlogFeed = new List<Log_Feed__c>();
    If(Trigger.isUpdate) {
        for (FeedItem f: trigger.new) {
            Log_Feed__c logFeed = new Log_Feed__c(Name='feed updated: '+f.Id,
                                                  Previous_Content__c=trigger.oldMap.get(f.Id).Body,
                                                  Actual_Content__c=f.Body);
            ListlogFeed.add(logFeed);
        }
    }
    If(Trigger.isDelete) {
        for (FeedItem f: trigger.old) {
            Log_Feed__c logFeed = new Log_Feed__c(Name='feed removed: '+f.Id,Previous_Content__c=f.Body);
            ListlogFeed.add(logFeed);
        }
    }
    try {
	    insert ListlogFeed;
    } catch (exception e) {
        system.debug('Insert error '+e.getMessage());
    }
}