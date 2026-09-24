package com.dakshabhi.contact.service;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.dakshabhi.common.StringUtility;
import com.dakshabhi.contact.dao.ContactDAO;
import com.dakshabhi.contact.dto.ContactDTO;
import com.dakshabhi.email.SupportEmailAction;

@WebServlet("/contact")

public class ContactService extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Inside get");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fName = StringUtility.removeNull(req.getParameter("fname"));
		String lName = StringUtility.removeNull(req.getParameter("lname"));
		String email = StringUtility.removeNull(req.getParameter("email"));
		String subject = StringUtility.removeNull(req.getParameter("subject"));
		String message = StringUtility.removeNull(req.getParameter("message"));
		String country = StringUtility.removeNull(req.getParameter("country"));

		ContactDTO contactDTO = new ContactDTO();

		contactDTO.setFirstName(fName);
		contactDTO.setLastName(lName);
		contactDTO.setEmail(email);
		contactDTO.setSubject(subject);
		contactDTO.setMessage(message);
		contactDTO.setCountry(country);

		ContactDAO objcontact = new ContactDAO();
		objcontact.saveContactDetails(contactDTO);

		// send email
		SupportEmailAction.sendCustomerSupportEmail(contactDTO);
		sendSlackNotification(contactDTO);
		resp.setContentType("application/plain");
		resp.getWriter().write("success");

	}

	private void sendSlackNotification(ContactDTO contactDTO) {

		try {
			System.out.println("-----Sending Slack Notificagtion For Customer Support------");
			URL url = new URL("https://hooks.slack.com/services/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");

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");

			JSONObject json = new JSONObject();
			json.put("blocks", new org.json.JSONArray()
					.put(new JSONObject().put("type", "section").put("text",
							new JSONObject().put("type", "mrkdwn").put("text", "*New Support mail*")))
					.put(new JSONObject().put("type", "section").put("fields",
							new org.json.JSONArray()
									.put(new JSONObject().put("type", "mrkdwn").put("text", "*Name:* " + contactDTO.getFirstName() + " " + contactDTO.getLastName()))
									.put(new JSONObject().put("type", "mrkdwn").put("text", "*Email:* " + contactDTO.getEmail()))
									.put(new JSONObject().put("type", "mrkdwn").put("text", "*Subject:* " + contactDTO.getSubject()))
									.put(new JSONObject().put("type", "mrkdwn").put("text", "*Country:* " + getCountryFullName(contactDTO.getCountry())))
									.put(new JSONObject().put("type", "mrkdwn").put("text", "*Message:* " + contactDTO.getMessage())))));

			String jsonString = json.toString();
			byte[] input = jsonString.getBytes(StandardCharsets.UTF_8);

			try (OutputStream os = conn.getOutputStream()) {
				os.write(input, 0, input.length);
			}

			int responseCode = conn.getResponseCode();
			if (responseCode != HttpURLConnection.HTTP_OK) {
				System.err.println("Failed to send notification. Response code: " + responseCode);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	private static String getCountryFullName(String countryCode) { 
		switch (countryCode) {
		case "AF": 
			 return "Afghanistan";
			case "AX": 
			 return "Islands";
			case "AL": 
			 return "Albania";
			case "DZ": 
			 return "Algeria";
			case "AS": 
			 return "American Samoa";
			case "AD": 
			 return "Andorra";
			case "AO": 
			 return "Angola";
			case "AI": 
			 return "Anguilla";
			case "AQ": 
			 return "Antarctica";
			case "AG": 
			 return "Antigua and Barbuda";
			case "AR": 
			 return "Argentina";
			case "AM": 
			 return "Armenia";
			case "AW": 
			 return "Aruba";
			case "AU": 
			 return "Australia";
			case "AT": 
			 return "Austria";
			case "AZ": 
			 return "Azerbaijan";
			case "BS": 
			 return "Bahamas";
			case "BH": 
			 return "Bahrain";
			case "BD": 
			 return "Bangladesh";
			case "BB": 
			 return "Barbados";
			case "BY": 
			 return "Belarus";
			case "PW": 
			 return "Belau";
			case "BE": 
			 return "Belgium";
			case "BZ": 
			 return "Belize";
			case "BJ": 
			 return "Benin";
			case "BM": 
			 return "Bermuda";
			case "BT": 
			 return "Bhutan";
			case "BO": 
			 return "Bolivia";
			case "BQ": 
			 return "Bonaire, Saint Eustatius and Saba";
			case "BA": 
			 return "Bosnia and Herzegovina";
			case "BW": 
			 return "Botswana";
			case "BV": 
			 return "Bouvet Island";
			case "BR": 
			 return "Brazil";
			case "IO": 
			 return "British Indian Ocean Territory";
			case "BN": 
			 return "Brunei";
			case "BG": 
			 return "Bulgaria";
			case "BF": 
			 return "Burkina Faso";
			case "BI": 
			 return "Burundi";
			case "KH": 
			 return "Cambodia";
			case "CM": 
			 return "Cameroon";
			case "CA": 
			 return "Canada";
			case "CV": 
			 return "Cape Verde";
			case "KY": 
			 return "Cayman Islands";
			case "CF": 
			 return "Central African Republic";
			case "TD": 
			 return "Chad";
			case "CL": 
			 return "Chile";
			case "CN": 
			 return "China";
			case "CX": 
			 return "Christmas Island";
			case "CC": 
			 return "Cocos (Keeling) Islands";
			case "CO": 
			 return "Colombia";
			case "KM": 
			 return "Comoros";
			case "CG": 
			 return "Congo (Brazzaville)";
			case "CD": 
			 return "Congo (Kinshasa)";
			case "CK": 
			 return "Cook Islands";
			case "CR": 
			 return "Costa Rica";
			case "HR": 
			 return "Croatia";
			case "CU": 
			 return "Cuba";
			case "CW": 
			 return "CuraÃ§ao";
			case "CY": 
			 return "Cyprus";
			case "CZ": 
			 return "Czech Republic";
			case "DK": 
			 return "Denmark";
			case "DJ": 
			 return "Djibouti";
			case "DM": 
			 return "Dominica";
			case "DO": 
			 return "Dominican Republic";
			case "EC": 
			 return "Ecuador";
			case "EG": 
			 return "Egypt";
			case "SV": 
			 return "El Salvador";
			case "GQ": 
			 return "Equatorial Guinea";
			case "ER": 
			 return "Eritrea";
			case "EE": 
			 return "Estonia";
			case "SZ": 
			 return "Eswatini";
			case "ET": 
			 return "Ethiopia";
			case "FK": 
			 return "Falkland Islands";
			case "FO": 
			 return "Faroe Islands";
			case "FJ": 
			 return "Fiji";
			case "FI": 
			 return "Finland";
			case "FR": 
			 return "France";
			case "GF": 
			 return "French Guiana";
			case "PF": 
			 return "French Polynesia";
			case "TF": 
			 return "French Southern Territories";
			case "GA": 
			 return "Gabon";
			case "GM": 
			 return "Gambia";
			case "GE": 
			 return "Georgia";
			case "DE": 
			 return "Germany";
			case "GH": 
			 return "Ghana";
			case "GI": 
			 return "Gibraltar";
			case "GR": 
			 return "Greece";
			case "GL": 
			 return "Greenland";
			case "GD": 
			 return "Grenada";
			case "GP": 
			 return "Guadeloupe";
			case "GU": 
			 return "Guam";
			case "GT": 
			 return "Guatemala";
			case "GG": 
			 return "Guernsey";
			case "GN": 
			 return "Guinea";
			case "GW": 
			 return "Guinea-Bissau";
			case "GY": 
			 return "Guyana";
			case "HT": 
			 return "Haiti";
			case "HM": 
			 return "Heard Island and McDonald Islands";
			case "HN": 
			 return "Honduras";
			case "HK": 
			 return "Hong Kong";
			case "HU": 
			 return "Hungary";
			case "IS": 
			 return "Iceland";
			case "IN": 
			 return "India";
			case "ID": 
			 return "Indonesia";
			case "IR": 
			 return "Iran";
			case "IQ": 
			 return "Iraq";
			case "IE": 
			 return "Ireland";
			case "IM": 
			 return "Isle of Man";
			case "IL": 
			 return "Israel";
			case "IT": 
			 return "Italy";
			case "CI": 
			 return "Ivory Coast";
			case "JM": 
			 return "Jamaica";
			case "JP": 
			 return "Japan";
			case "JE": 
			 return "Jersey";
			case "JO": 
			 return "Jordan";
			case "KZ": 
			 return "Kazakhstan";
			case "KE": 
			 return "Kenya";
			case "KI": 
			 return "Kiribati";
			case "KW": 
			 return "Kuwait";
			case "KG": 
			 return "Kyrgyzstan";
			case "LA": 
			 return "Laos";
			case "LV": 
			 return "Latvia";
			case "LB": 
			 return "Lebanon";
			case "LS": 
			 return "Lesotho";
			case "LR": 
			 return "Liberia";
			case "LY": 
			 return "Libya";
			case "LI": 
			 return "Liechtenstein";
			case "LT": 
			 return "Lithuania";
			case "LU": 
			 return "Luxembourg";
			case "MO": 
			 return "Macao";
			case "MG": 
			 return "Madagascar";
			case "MW": 
			 return "Malawi";
			case "MY": 
			 return "Malaysia";
			case "MV": 
			 return "Maldives";
			case "ML": 
			 return "Mali";
			case "MT": 
			 return "Malta";
			case "MH": 
			 return "Marshall Islands";
			case "MQ": 
			 return "Martinique";
			case "MR": 
			 return "Mauritania";
			case "MU": 
			 return "Mauritius";
			case "YT": 
			 return "Mayotte";
			case "MX": 
			 return "Mexico";
			case "FM": 
			 return "Micronesia";
			case "MD": 
			 return "Moldova";
			case "MC": 
			 return "Monaco";
			case "MN": 
			 return "Mongolia";
			case "ME": 
			 return "Montenegro";
			case "MS": 
			 return "Montserrat";
			case "MA": 
			 return "Morocco";
			case "MZ": 
			 return "Mozambique";
			case "MM": 
			 return "Myanmar";
			case "NA": 
			 return "Namibia";
			case "NR": 
			 return "Nauru";
			case "NP": 
			 return "Nepal";
			case "NL": 
			 return "Netherlands";
			case "NC": 
			 return "New Caledonia";
			case "NZ": 
			 return "New Zealand";
			case "NI": 
			 return "Nicaragua";
			case "NE": 
			 return "Niger";
			case "NG": 
			 return "Nigeria";
			case "NU": 
			 return "Niue";
			case "NF": 
			 return "Norfolk Island";
			case "KP": 
			 return "North Korea";
			case "MK": 
			 return "North Macedonia";
			case "MP": 
			 return "Northern Mariana Islands";
			case "NO": 
			 return "Norway";
			case "OM": 
			 return "Oman";
			case "PK": 
			 return "Pakistan";
			case "PS": 
			 return "Palestinian Territory";
			case "PA": 
			 return "Panama";
			case "PG": 
			 return "Papua New Guinea";
			case "PY": 
			 return "Paraguay";
			case "PE": 
			 return "Peru";
			case "PH": 
			 return "Philippines";
			case "PN": 
			 return "Pitcairn";
			case "PL": 
			 return "Poland";
			case "PT": 
			 return "Portugal";
			case "PR": 
			 return "Puerto Rico";
			case "QA": 
			 return "Qatar";
			case "RE": 
			 return "Reunion";
			case "RO": 
			 return "Romania";
			case "RU": 
			 return "Russia";
			case "RW": 
			 return "Rwanda";
			case "BL": 
			 return "Saint BarthÃ©lemy";
			case "SH": 
			 return "Saint Helena";
			case "KN": 
			 return "Saint Kitts and Nevis";
			case "LC": 
			 return "Saint Lucia";
			case "SX": 
			 return "Saint Martin (Dutch part)";
			case "MF": 
			 return "Saint Martin (French part)";
			case "PM": 
			 return "Saint Pierre and Miquelon";
			case "VC": 
			 return "Saint Vincent and the Grenadines";
			case "WS": 
			 return "Samoa";
			case "SM": 
			 return "San Marino";
			case "ST": 
			 return "SÃ£o TomÃ© and PrÃ­ncipe";
			case "SA": 
			 return "Saudi Arabia";
			case "SN": 
			 return "Senegal";
			case "RS": 
			 return "Serbia";
			case "SC": 
			 return "Seychelles";
			case "SL": 
			 return "Sierra Leone";
			case "SG": 
			 return "Singapore";
			case "SK": 
			 return "Slovakia";
			case "SI": 
			 return "Slovenia";
			case "SB": 
			 return "Solomon Islands";
			case "SO": 
			 return "Somalia";
			case "ZA": 
			 return "South Africa";
			case "GS": 
			 return "South Georgia/Sandwich Islands";
			case "KR": 
			 return "South Korea";
			case "SS": 
			 return "South Sudan";
			case "ES": 
			 return "Spain";
			case "LK": 
			 return "Sri Lanka";
			case "SD": 
			 return "Sudan";
			case "SR": 
			 return "Suriname";
			case "SJ": 
			 return "Svalbard and Jan Mayen";
			case "SE": 
			 return "Sweden";
			case "CH": 
			 return "Switzerland";
			case "SY": 
			 return "Syria";
			case "TW": 
			 return "Taiwan";
			case "TJ": 
			 return "Tajikistan";
			case "TZ": 
			 return "Tanzania";
			case "TH": 
			 return "Thailand";
			case "TL": 
			 return "Timor-Leste";
			case "TG": 
			 return "Togo";
			case "TK": 
			 return "Tokelau";
			case "TO": 
			 return "Tonga";
			case "TT": 
			 return "Trinidad and Tobago";
			case "TN": 
			 return "Tunisia";
			case "TR": 
			 return "Turkey";
			case "TM": 
			 return "Turkmenistan";
			case "TC": 
			 return "Turks and Caicos Islands";
			case "TV": 
			 return "Tuvalu";
			case "UG": 
			 return "Uganda";
			case "UA": 
			 return "Ukraine";
			case "AE": 
			 return "United Arab Emirates";
			case "GB": 
			 return "United Kingdom (UK)";
			case "US": 
			 return "United States (US)";
			case "UM": 
			 return "United States (US) Minor Outlying Islands";
			case "UY": 
			 return "Uruguay";
			case "UZ": 
			 return "Uzbekistan";
			case "VU": 
			 return "Vanuatu";
			case "VA": 
			 return "Vatican";
			case "VE": 
			 return "Venezuela";
			case "VN": 
			 return "Vietnam";
			case "VG": 
			 return "Virgin Islands (British)";
			case "VI": 
			 return "Virgin Islands (US)";
			case "WF": 
			 return "Wallis and Futuna";
			case "EH": 
			 return "Western Sahara";
			case "YE": 
			 return "Yemen";
			case "ZM": 
			 return "Zambia";
			case "ZW": 
			 return "Zimbabwe";  
		}
		return "";
	}
}
