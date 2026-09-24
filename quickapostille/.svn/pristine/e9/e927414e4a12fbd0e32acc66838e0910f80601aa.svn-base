package com.dakshabhi.contact.dao;

import com.dakshabhi.common.db.QueryHelper;
import com.dakshabhi.contact.dto.ContactDTO;

public class ContactDAO {

	public boolean saveContactDetails(ContactDTO contactDTO) {

		QueryHelper qh = new QueryHelper();
		try {
			String sql = "INSERT INTO qa_contact(first_name, last_name, email, subject, message,date_added) VALUES (?,?,?,?,?,now())";

			System.out.println(sql);
			
			qh.addParam(contactDTO.getFirstName());
			qh.addParam(contactDTO.getLastName());
			qh.addParam(contactDTO.getEmail());
			qh.addParam(contactDTO.getSubject());
			qh.addParam(contactDTO.getMessage());
			qh.runQuery(sql);			
			return true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			qh.releaseConnection();
		}

		return false;
	}
}
