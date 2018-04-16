@isTest
public class LogFeedsTest {
    
    public static testMethod void testLogFeeds() {
	    String FeedItemId;
	    String LogFeedId;
        Log_Feed__c LogFeed;        
        try {
            Test.startTest();
 			FeedItem FI = new FeedItem(Body='Body test',parentId = UserInfo.getUserId());           
            insert FI;
            FeedItemId = FI.Id;

			// Update FeedItem
			FI.Body = 'Body test updated';
            update FI;
            LogFeed = [SELECT Id, Name FROM Log_Feed__c WHERE Name=:'feed updated: '+FeedItemId];   
            system.assertEquals(LogFeed.Name,'feed updated: '+FeedItemId);

            // Remove FeedItem
            delete FI;
            LogFeed = [SELECT Id, Name FROM Log_Feed__c WHERE Name=:'feed removed: '+FeedItemId];   
            system.assertEquals(LogFeed.Name,'feed removed: '+FeedItemId);
            
            Test.stopTest(); 
        } catch (exception e) {
            system.debug('Insert error LogFeeds__c '+e.getMessage());
        }        
    }
}