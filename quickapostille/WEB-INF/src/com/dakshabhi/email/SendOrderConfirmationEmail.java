package com.dakshabhi.email;

import java.io.IOException;
import java.sql.ResultSet;
import java.text.Format;
import java.text.MessageFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.dakshabhi.common.StringUtility;
import com.dakshabhi.common.db.QueryHelper;
import com.dakshabhi.common.mail.SMTPAuthenticator;
import com.dakshabhi.common.mail.Utility;

public class SendOrderConfirmationEmail {
	private static String msgtxt = null;
	protected static Session mailSession = null;
	protected static Transport transport = null;
	protected static String smtpAddress = "smtp-relay.brevo.com";
	protected static String mailProtocol = "smtp";
	protected static String mailUsername = "88e904001@smtp-brevo.com";
	protected static String mailPassword = "C91PgwrVhZsF03UG";
	static {
		Authenticator auth = new SMTPAuthenticator(mailUsername, mailPassword);
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", mailProtocol);
		props.setProperty("mail.smtp.host", smtpAddress);
		props.setProperty("mail.smtp.port", "587");
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.debug", "false");
		mailSession = Session.getInstance(props, auth);
	}
	static {
		try {
			msgtxt = Utility.getResourceFileAsString(SendOrderConfirmationEmail.class, "orderConfirmation.txt");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public boolean sendConfirmationEmail(int orderId) {
		
		QueryHelper qh = new QueryHelper();
		try {
			String sql = "select qa_order.*, DATE_FORMAT(qa_order.date_created, '%M %d, %Y') as order_date from qa_order where id =  ?";
			qh.addParam(orderId);
			ResultSet rs = qh.runQueryStreamResults(sql);
			if(rs.next()) {
				String fullName = StringUtility.removeNull(rs.getString("first_name")) + " " + StringUtility.removeNull(rs.getString("last_name")) ;
				String email = StringUtility.removeNull(rs.getString("email"));
				String phone = StringUtility.removeNull(rs.getString("phone_no"));
				String address = StringUtility.removeNull(rs.getString("street_address"));
				String city = StringUtility.removeNull(rs.getString("city"));
				String state = StringUtility.removeNull(rs.getString("state"));
				String zip =  StringUtility.removeNull(rs.getString("postal_code"));
				String country = getCountryFullName(StringUtility.removeNull(rs.getString("country"))) + "("+ StringUtility.removeNull(rs.getString("country"))+")";
				String currencySymbol = getCurrencySymbol(StringUtility.removeNull(rs.getString("currency_code")));
				String shippingMethod = StringUtility.removeNull(rs.getString("shipping_method"));
				if(rs.getDouble("shipping_cost") > 0) {
					shippingMethod = shippingMethod + " (" +String.format("%.2f", rs.getDouble("shipping_cost")) +")";
				}
				 
				String notes   = StringUtility.removeNull(rs.getString("notes"));
				String totalCost = String.format("%.2f", rs.getDouble("order_total_amount")); 
				String extraServices = getExtraServicesDetails(orderId,currencySymbol);
				int quantity  = rs.getInt("quantity");
				String productCost = String.format("%.2f", (quantity * rs.getDouble("product_price"))); 
				String orderDate = StringUtility.removeNull(rs.getString("order_date"));
				Format format = new MessageFormat(msgtxt);
				String[] mArgs = { ""+ orderId, fullName , orderDate, ""+quantity, currencySymbol, productCost, shippingMethod,
						extraServices.toString(), totalCost, address, city, state, zip, country,
						phone, email, notes };
				String emailBody = format.format(mArgs);
				
				if (!"".equals(emailBody)) { 
					try { 
						MimeMessage mimemsg = new MimeMessage(mailSession);  
						mimemsg.setRecipients(Message.RecipientType.TO, email);
						mimemsg.setRecipients(Message.RecipientType.BCC, "deepak@1stopmove.com,dstewart@1stopmove.com");
						//mimemsg.setRecipients(Message.RecipientType.BCC, "msg2deepu@gmail.com");
						mimemsg.setFrom(new InternetAddress("Quick Apostille <order@quickapostille.online>"));
						 
						mimemsg.setSubject("[Quick Apostille]: New order #"+orderId, "UTF-8");

						mimemsg.setText(emailBody);
						mimemsg.setSentDate(new Date());

						mimemsg.setContent(emailBody, "text/html");
						if ((transport != null) && (transport.isConnected())) {
							transport.sendMessage(mimemsg, mimemsg.getAllRecipients());
						} else {
							transport = mailSession.getTransport("smtp");
							transport.connect(mailUsername, mailPassword);
							transport.sendMessage(mimemsg, mimemsg.getAllRecipients());
						}
						return true;
					}

					catch (Exception e) { 
						e.printStackTrace();
						return false;
					}

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			qh.releaseConnection();
		}
		
		
		
		return false;
	}

	private String getCountryFullName(String countryCode) { 
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

	private double getProdcutPrice(String currencyCode) {
		double productPrice = 180;
		switch (currencyCode) {
		case "AED":
			productPrice = 800;
			break; 
		default:
			productPrice = 180;
			break;
		}
		return productPrice;
	}

	private String getCurrencySymbol(String currencyCode) {
		String currencySymbol = "USD";
		
		switch (currencyCode) {
		case "EUR":
			currencySymbol = "&euro;";
			break;
		case "GBP":
			currencySymbol = "&pound;";
			break;
		case "AED":
			currencySymbol = "AED";
			break;
		default:
			currencySymbol = "USD";
			break;
		}
		return currencySymbol;
	}

	private String getExtraServicesDetails(int orderId, String currencySymbol) {
		QueryHelper qh = new QueryHelper();
		StringBuffer extraServices = new StringBuffer("");
		try {
			String sql = "SELECT * FROM  qa_order_products where order_id = ?";
			qh.addParam(orderId);
			ResultSet rs = qh.runQueryStreamResults(sql);
			while(rs.next()) {
				extraServices.append(
						"<tr><th scope=\"row\" colspan=\"2\" align=\"left\" style=\"color: #636363; border: 1px solid #e5e5e5; vertical-align: middle; text-align: left; padding: 12px\">" + rs.getString("prodcut_name") + " x "+ rs.getInt("product_quantity")+":</th>");
				extraServices.append(
						"<td align=\"left\" style=\"color: #636363; border: 1px solid #e5e5e5; vertical-align: middle; text-align: left; padding: 12px\"> 	<span><span>"+currencySymbol+"</span>"+ String.format("%.2f", (rs.getInt("product_quantity") *  rs.getDouble("product_price"))) +"</span> </td> </tr>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			qh.releaseConnection();
		}
		 
		return extraServices.toString();
	}
	
	 
}
