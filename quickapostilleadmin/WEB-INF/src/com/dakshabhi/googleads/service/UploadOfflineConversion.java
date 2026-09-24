package com.dakshabhi.googleads.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.Instant;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.ads.googleads.lib.GoogleAdsClient;
import com.google.ads.googleads.v19.services.ClickConversion;
import com.google.ads.googleads.v19.services.ClickConversionResult;
import com.google.ads.googleads.v19.services.ConversionUploadServiceClient;
import com.google.ads.googleads.v19.services.UploadClickConversionsRequest;
import com.google.ads.googleads.v19.services.UploadClickConversionsResponse;
import com.google.ads.googleads.v19.utils.ResourceNames;
import com.google.auth.oauth2.UserCredentials;

@WebServlet("/oauthcallback")
public class UploadOfflineConversion extends HttpServlet{
	private static final String CLIENT_ID = "492912529489-p0nvpdbqk7ntj90hkq2tdprt1o3ingo3.apps.googleusercontent.com";
    private static final String CLIENT_SECRET = "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";
    private static final String REDIRECT_URI = "https://adminweb.quickapostille.online/oauthcallback";
    private static final String SCOPE = "https://www.googleapis.com/auth/adwords";
    private static final String DEVELOPERTOKEN = "16_ewPwZhyDEA0hOcTrumw";
    private static String REFRESHTOKEN = "";
    private static final String CONVERSIONACTIONID = "6838806439"; 
    private static final String CUSTOMERID = "3155345848";
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    String code = request.getParameter("code");
		    String gclid = request.getParameter("gclid");
	        if (code == null) {
	        	request.getSession().setAttribute("gclid", gclid);
	            // Step 1: Redirect to Google's OAuth2 consent screen
	            String authUrl = "https://accounts.google.com/o/oauth2/v2/auth"
	                    + "?client_id=" + CLIENT_ID
	                    + "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8")
	                    + "&response_type=code"
	                    + "&scope=" + URLEncoder.encode(SCOPE, "UTF-8")
	                    + "&access_type=offline"
	                    + "&prompt=consent";

	            response.sendRedirect(authUrl);
	        } else {
	        	gclid = (String) request.getSession().getAttribute("gclid");
	        	System.out.println("gclid" +gclid);
	            // Step 2: Exchange code for tokens
	            URL url = new URL("https://oauth2.googleapis.com/token");
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);
	            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

	            String params = "code=" + URLEncoder.encode(code, "UTF-8")
	                    + "&client_id=" + URLEncoder.encode(CLIENT_ID, "UTF-8")
	                    + "&client_secret=" + URLEncoder.encode(CLIENT_SECRET, "UTF-8")
	                    + "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8")
	                    + "&grant_type=authorization_code";
	          
	            System.out.println(params);

	            try (OutputStream os = conn.getOutputStream()) {
	                os.write(params.getBytes());
	            }
	            try {		            
		            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		            StringBuilder tokenResponse = new StringBuilder();
		            String line;
		            while ((line = reader.readLine()) != null) {
		                tokenResponse.append(line);
		            }	
		            JSONObject jsonObject = null;
				
					jsonObject = new JSONObject(tokenResponse.toString());
					REFRESHTOKEN = jsonObject.getString("refresh_token");
					System.out.println("Refresh Token :" + REFRESHTOKEN);
					uploadConversion(gclid);
				} catch (JSONException e) {
					e.printStackTrace();
				}	           
	        }		
	}
	
    public void uploadConversion(String gclid) throws IOException {
    	try {
	    	System.out.println(REFRESHTOKEN);
	        UserCredentials credentials = UserCredentials.newBuilder()
	                .setClientId(CLIENT_ID)
	                .setClientSecret(CLIENT_SECRET)
	                .setRefreshToken(REFRESHTOKEN)
	                .build();
	
	        GoogleAdsClient googleAdsClient = GoogleAdsClient.newBuilder()
	        		.setDeveloperToken(DEVELOPERTOKEN)
	        		.setCredentials(credentials)
	        		.build();
	        
	        ClickConversion conversion = ClickConversion.newBuilder()
	                .setConversionAction(ResourceNames.conversionAction(
	                        Long.parseLong(CUSTOMERID),
	                        Long.parseLong(CONVERSIONACTIONID)))
	                .setGclid(gclid)
	                .setConversionDateTime(Instant.now().toString()) 
	                .setConversionValue(1)
	                .setCurrencyCode("EUR")
	                .build();
	
	        UploadClickConversionsRequest request = UploadClickConversionsRequest.newBuilder()
	                .setCustomerId(CUSTOMERID)
	                .addConversions(conversion)
	                .setPartialFailure(true)
	                .build();
       
        	ConversionUploadServiceClient uploadClient =  googleAdsClient.getLatestVersion().createConversionUploadServiceClient();
            UploadClickConversionsResponse response = uploadClient.uploadClickConversions(request);
            for (ClickConversionResult result : response.getResultsList()) {
                System.out.printf("Uploaded conversion with GCLID: %s%n", result.getGclid());
            }
        }catch (Exception e) {
			e.printStackTrace();
		}
    }
}
