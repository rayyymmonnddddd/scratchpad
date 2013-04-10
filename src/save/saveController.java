package save;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

//For http request
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//for amazon 
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.util.StringUtils;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.sun.tools.javac.util.List;


public class saveController {

	public static void main(String[] args){
	//public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String filename = "filename";
		String filetype = "filetype";
		String content = "content";
		
		//Connecting to S3 
		String secretKey = "ctFMvj+c1Jmh9tHBi0zaTImmxL1GQIIAdWiBXrVx";
		String accessKey = "AKIAINULFTWQFFTCD2EQ";
		BasicAWSCredentials awsCredentials = new BasicAWSCredentials(accessKey, secretKey);
		AmazonS3 s3 = new AmazonS3Client(awsCredentials);
		
		String testValue = "knnbccb";
		String bucketName = "bencees";
	    String key = "test.txt";
	    File file = new File("/Users/yj_ben/Dropbox/Straying Sons/favicon.jpg");

	    System.out.println("Uploading a new object to S3 from a file");
	    //s3.putObject(new PutObjectRequest(bucketName, key, file));
	    
	    //s3.deleteObject(bucketName, key);
	    
	    ByteArrayInputStream input = new ByteArrayInputStream(testValue.getBytes());
	    
	    s3.putObject(bucketName, filename , input, new ObjectMetadata());
	    
	    //s3.putObject(new PutObjectRequest(bucketName, key, filename));
	    
		//S3Service s3Service = new RestS3Service(awsCredentials);
		//AmazonS3 conn = new AmazonS3Client(awsCredentials);
		//conn.setEndpoint("s3-website-ap-southeast-1.amazonaws.com");
	}
	
}
