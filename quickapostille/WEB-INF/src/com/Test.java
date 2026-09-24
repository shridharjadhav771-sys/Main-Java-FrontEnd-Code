package com;

import org.json.JSONObject;

public class Test {

	public static void main(String[] args) {
		try {
			JSONObject jsonObject = new JSONObject("{\"id\":\"5171\",\"parent_id\":0}");
			System.out.println(jsonObject.get("id").toString());
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
