public with sharing class EventController {
    @AuraEnabled(cacheable=true)
    public static List<Event> getEventList() {
        return [SELECT Id, Subject, Description FROM Event LIMIT 10];
    }
}