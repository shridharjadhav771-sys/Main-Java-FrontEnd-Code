package com.dakshabhi.common;

import java.util.GregorianCalendar;

public class StringUtility {

	public static String removeNull(String str) {
        return str == null ? "" : str;
    }
    
    public static String removeNull(String str,String replaceStr) {
        return str == null ? replaceStr : str;
    }
    
    /* This method is used to generate random key.
     * @return String
     */
    public static String generateKey() {
    	char[] charStr = new char[52];
    	for(int index =0, chr = 65; index < 52; index ++, chr ++) {
 	    	charStr[index] = (char) (chr); 
 	    	if (chr == 90) {
 	    		chr = 97;
 	    	}
    	}
    	GregorianCalendar cal = new GregorianCalendar();
    	long tm = cal.getTimeInMillis();
    	String key = ""; 
    	while (tm > 0) {
 	    	int rem = (int)(tm % 100);
 	    	if(rem > 51) {
 		    	rem = (int)(tm % 10);
 		    	tm = tm/10; 
 	    	}
 	    	key += ""+ charStr[rem];
 	    	tm = tm/10;
    	}
    	return Math.round(Math.random()*10000) + key;
    }
}
