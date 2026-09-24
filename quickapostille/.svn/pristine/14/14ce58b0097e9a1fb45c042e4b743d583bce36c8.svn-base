package com.dakshabhi.common.constants;

import javax.naming.InitialContext;

import com.dakshabhi.common.log.Loger;

public class ConfigConstants {
	/**
	 * Singlton Object
	 */ 
	private static ConfigConstants cc = null;
	
	public static int MAX_FILES = 3;
	
	public static int FILE_SIZE = 3000000;
	
	public static String FILE_EXTENSIONS = ".doc,.txt,.zip";

	private Boolean debug = Boolean.FALSE;

	private Boolean info = Boolean.FALSE;

	private Boolean level3 = Boolean.FALSE;

	public ConfigConstants() {
		try {
			InitialContext ic = new InitialContext();
			debug = Boolean.valueOf((String) ic
					.lookup("java:comp/env/DebugLevel"));

			info = Boolean.valueOf((String) ic.lookup("java:comp/env/Info"));

			level3 = Boolean
					.valueOf((String) ic.lookup("java:comp/env/Level3"));
		} catch (Exception ee) {
            Loger.log("error in ConfigConstants class-" + ee);
		}

	}

	/**
	 * getInstance of singlton ConfigConstants object
	 */
	public static ConfigConstants getInstance() {

		if (cc != null) {
			return cc;
		} else {
			cc = new ConfigConstants();
			return cc;
		}
	}

	public Boolean getDebug() {
		return debug;
	}

	public Boolean getInfo() {
		return info;
	}

	public Boolean getLevel3() {
		return level3;
	} 
}
