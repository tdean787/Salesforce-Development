public class fieldTestController {
        public List<SelectOption> listOfObjects{get;set;}
    public List<SelectOption> listOfFields{get;set;}
        public String selectedObject{get;set;}
    public String selectedField{get;set;}
    public List<FieldPermissions> fp{get;set;} 
        
    public Map<String, Schema.SobjectType> gd = schema.getGlobalDescribe();
    public Map<String, Schema.SObjectField> MapOfFields;
    
    public fieldTestController(){
        //fp = [SELECT Parent.Profile.Name, Parent.Label, Parent.IsOwnedByProfile, SobjectType, Field, PermissionsEdit, PermissionsRead 
//FROM FieldPermissions
//WHERE SobjectType = 'Contact' AND Field = 'Contact.Department'];
        fp = [select Field, ParentId, PermissionsEdit, Parent.Name, Parent.Label, Parent.Profile.Name from FieldPermissions WHERE SobjectType = 'Contact'];
        listOfObjects = new List<SelectOption>();
        
        Integer counter = 1;
        for(Schema.SObjectType obj: gd.values()){
            if(counter >= 999)
                break;
            Schema.DescribeSObjectResult dr = obj.getDescribe();
            listOfObjects.add(new SelectOption(String.valueOf(dr.getName()), String.valueOf(dr.getLabel())));
            counter++;
        }
        listOfObjects.sort();
     }
        
        
        public void fetchFields(){
            listOfFields = new List<SelectOption>();
            MapOfFields = gd.get(selectedObject).getDescribe().fields.getMap();
            
            for(Schema.SObjectfield field: MapOfFields.values()) {
                Schema.DescribefieldResult dfr = field.getDescribe();
                listOfFields.add(new SelectOption(String.valueOf(dfr.getName()), String.valueof(dfr.getLabel())));
            }
        }
    
    public void selectedfield() {
        system.debug(selectedField);
        List<FieldPermissions> fp = [SELECT Parent.Profile.Name, Parent.Label, Parent.IsOwnedByProfile, SobjectType, Field, PermissionsEdit, PermissionsRead 
FROM FieldPermissions
WHERE SobjectType = 'Contact' AND Field = 'Contact.Department'];
    }
    


}