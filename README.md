# LogFeeds

This app allows to register every update and delete action executed in feed items. The customer object (Log_Feed__c) is created to save these information.

<a href="https://githubsfdeploy.herokuapp.com?owner=mgalvao2012&repo=LogFeeds&ref=master">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>


Post Install actions:
- Enable the tab "Log Feed" for each user (using profile ou permissions sets)
- Enable the right field permission for the fields Log_Feed__c.Actual_Content__c and Log_Feed__c.Previous_Content__c 
- Add the tab for any Application, for example, Salesforce Chatter.
