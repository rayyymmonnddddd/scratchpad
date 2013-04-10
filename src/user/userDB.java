package user;


import java.util.ArrayList;
import java.util.List;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.PropertiesCredentials;
import com.amazonaws.services.simpledb.AmazonSimpleDB;
import com.amazonaws.services.simpledb.AmazonSimpleDBClient;
import com.amazonaws.services.simpledb.model.Attribute;
import com.amazonaws.services.simpledb.model.BatchPutAttributesRequest;
import com.amazonaws.services.simpledb.model.CreateDomainRequest;
import com.amazonaws.services.simpledb.model.DeleteAttributesRequest;
import com.amazonaws.services.simpledb.model.DeleteDomainRequest;
import com.amazonaws.services.simpledb.model.Item;
import com.amazonaws.services.simpledb.model.PutAttributesRequest;
import com.amazonaws.services.simpledb.model.ReplaceableAttribute;
import com.amazonaws.services.simpledb.model.ReplaceableItem;
import com.amazonaws.services.simpledb.model.SelectRequest;

public class userDB {
	
	public void test(String username, String password) throws Exception {
		String secretKey = "ctFMvj+c1Jmh9tHBi0zaTImmxL1GQIIAdWiBXrVx";
		   String accessKey = "AKIAINULFTWQFFTCD2EQ";
		   BasicAWSCredentials basicAWSCredentials = new BasicAWSCredentials(accessKey, secretKey);
		   AmazonSimpleDB sdb = new AmazonSimpleDBClient(basicAWSCredentials);
		   
		// Create a domain
           String domain = "scratchpadDomain";
           System.out.println("Creating domain called " + domain + ".\n");
           sdb.createDomain(new CreateDomainRequest(domain));

           // List domains
           System.out.println("Listing all domains in your account:\n");
           for (String domainName : sdb.listDomains().getDomainNames()) {
               System.out.println("  " + domainName);
           }
           System.out.println();

           // Put data into a domain
           System.out.println("Putting data into " + domain + " domain.\n");
           //sdb.batchPutAttributes(new BatchPutAttributesRequest(domain, createUserData()));
           //boolean checkWR = loginCheck("weirui", "pw");
           //boolean checkBen = loginCheck("ben", "pw");
           boolean checkUser = loginCheck(username, password);
           
           
           // Select data from a domain
           // Notice the use of backticks around the domain name in our select expression.
           String selectExpression = "select * from `" + domain + "` where username = 'weirui'";
           System.out.println("Selecting: " + selectExpression + "\n");
           SelectRequest selectRequest = new SelectRequest(selectExpression);
           for (Item item : sdb.select(selectRequest).getItems()) {
               System.out.println("  Item");
               System.out.println("    Name: " + item.getName());
               for (Attribute attribute : item.getAttributes()) {
                   System.out.println("      Attribute");
                   System.out.println("        Name:  " + attribute.getName());
                   System.out.println("        Value: " + attribute.getValue());
               }
           }
	}
	
	public userDB(){
			
	}
	
	private static List<ReplaceableItem> createUserData() {
        List<ReplaceableItem> sampleData = new ArrayList<ReplaceableItem>();

        sampleData.add(new ReplaceableItem().withName("Item_01").withAttributes(
                new ReplaceableAttribute().withName("username").withValue("ben"),
                new ReplaceableAttribute().withName("password").withValue("pw")));
        sampleData.add(new ReplaceableItem().withName("Item_02").withAttributes(
                new ReplaceableAttribute().withName("username").withValue("weirui"),
                new ReplaceableAttribute().withName("password").withValue("pw")));
        return sampleData;
   }
   
   public static boolean loginCheck(String username, String password){
	   
	   String secretKey = "ctFMvj+c1Jmh9tHBi0zaTImmxL1GQIIAdWiBXrVx";
	   String accessKey = "AKIAINULFTWQFFTCD2EQ";
	   BasicAWSCredentials basicAWSCredentials = new BasicAWSCredentials(accessKey, secretKey);

	   AmazonSimpleDB sdb = new AmazonSimpleDBClient(basicAWSCredentials);
	   	
	   boolean check = false;
   		String domain = "scratchpadDomain";
   		String selectExpression = "select * from `" + domain + "` where username = '" + username + "'";
   		SelectRequest selectRequest = new SelectRequest(selectExpression);
   		for (Item item : sdb.select(selectRequest).getItems()) {
            if(sdb.select(selectRequest).getItems() == null){
            	check = false;
            }
            else{
            	for (Attribute attribute : item.getAttributes()) {
            		if(attribute.getValue().equals(password)){
            			check = true;
            		}
            	}
            }
        }
   		return check;
   }
}