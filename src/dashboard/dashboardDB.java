package dashboard;


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

public class dashboardDB {
	
	public dashboardDB(){
		
	}
	
	public static void insertCredentials(String filename, String username){

		
		   String secretKey = "ctFMvj+c1Jmh9tHBi0zaTImmxL1GQIIAdWiBXrVx";
		   String accessKey = "AKIAINULFTWQFFTCD2EQ";
		   BasicAWSCredentials basicAWSCredentials = new BasicAWSCredentials(accessKey, secretKey);
		   AmazonSimpleDB sdb = new AmazonSimpleDBClient(basicAWSCredentials);
		   String domain = "projectDomain";
		   sdb.createDomain(new CreateDomainRequest(domain));
		   
		   List<ReplaceableItem> credentialsData = new ArrayList<ReplaceableItem>();
		   credentialsData.add(new ReplaceableItem().withName("Item_01").withAttributes(
				   new ReplaceableAttribute().withName("filename").withValue(filename),
				   new ReplaceableAttribute().withName("username").withValue(username)));
	            
		   
		   sdb.batchPutAttributes(new BatchPutAttributesRequest(domain, credentialsData));   
	   }
}