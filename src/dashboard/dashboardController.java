package dashboard;
import user.*;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.*;
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
import com.amazonaws.regions.Region;
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

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import account.accountDB;

public class dashboardController extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		//Add code below to print the total number of users in the database.
		//String username = request.getParameter("userid");
		//String password = request.getParameter("pswrd");
		
		//retrieve projectname
		String filename = request.getParameter("projectname");
		String username = (String) session.getAttribute("theName");
		//String Email = request.getParameter("Id");
		//session.setAttribute("sessEmail",Email);
		
		dashboardDB pDB = new dashboardDB();
		pDB.insertCredentials(filename, username);
		s3Folder(filename,username);
		response.sendRedirect("dashboard.jsp");	
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	public void s3Folder(String filename, String username){
		//Connecting to S3 
				String secretKey = "ctFMvj+c1Jmh9tHBi0zaTImmxL1GQIIAdWiBXrVx";
				String accessKey = "AKIAINULFTWQFFTCD2EQ";
				BasicAWSCredentials awsCredentials = new BasicAWSCredentials(accessKey, secretKey);
				AmazonS3 s3 = new AmazonS3Client(awsCredentials);
				
				String bucketName = username +"-" +filename;
				
				Bucket asiaPacificBucket = s3.createBucket(bucketName,com.amazonaws.services.s3.model.Region.AP_Singapore);
	}
	
	public ArrayList<String> retrieveBuckets(String userName){
		
		ArrayList<String> projToReturn = new ArrayList<String>();
		
		
		String secretKey = "ctFMvj+c1Jmh9tHBi0zaTImmxL1GQIIAdWiBXrVx";
		String accessKey = "AKIAINULFTWQFFTCD2EQ";
		BasicAWSCredentials awsCredentials = new BasicAWSCredentials(accessKey, secretKey);
		AmazonS3 s3 = new AmazonS3Client(awsCredentials);
		
		List<Bucket> allS3Buckets = (List<Bucket>) s3.listBuckets();
		for (int i =0; i < allS3Buckets.size(); i++){
			String currentBucket = allS3Buckets.get(i).getName();
				int dash = currentBucket.indexOf("-");
				String usernameOfBucket = currentBucket.substring(0,dash);
				if (userName.equals(usernameOfBucket)) {
					projToReturn.add(currentBucket.substring(dash+1));
				}
		}
		
		return projToReturn;
		
	}
	
	public String retrieveBucketNames(){
		String returnNames = "";
		String secretKey = "ctFMvj+c1Jmh9tHBi0zaTImmxL1GQIIAdWiBXrVx";
		String accessKey = "AKIAINULFTWQFFTCD2EQ";
		BasicAWSCredentials awsCredentials = new BasicAWSCredentials(accessKey, secretKey);
		AmazonS3 s3 = new AmazonS3Client(awsCredentials);
		
		List<Bucket> allS3Buckets = (List<Bucket>) s3.listBuckets();
		for (int i =0; i < allS3Buckets.size(); i++){
			returnNames += allS3Buckets.get(i).getName();
		}
		return returnNames;
	}
}
