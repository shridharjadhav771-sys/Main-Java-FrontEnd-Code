package com.dakshabhi.email;

import java.io.IOException;
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
import com.dakshabhi.common.mail.SMTPAuthenticator;
import com.dakshabhi.common.mail.Utility;
import com.dakshabhi.contact.dto.ContactDTO;

public class SupportEmailAction {
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
			msgtxt = Utility.getResourceFileAsString(SupportEmailAction.class, "customerSupport.txt");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static boolean sendCustomerSupportEmail(ContactDTO contactDTO) {
		String emailBody = "";
		try {

			Format format = new MessageFormat(msgtxt);

			String[] args = { StringUtility.removeNull(contactDTO.getEmail()),
					StringUtility.removeNull(contactDTO.getSubject()),
					StringUtility.removeNull(contactDTO.getFirstName() + " " + contactDTO.getLastName()),
					StringUtility.removeNull(contactDTO.getMessage()) };

			emailBody = format.format(args);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (!"".equals(emailBody)) { 
			try { 
				MimeMessage mimemsg = new MimeMessage(mailSession);  
				mimemsg.setRecipients(Message.RecipientType.TO, "support@quickapostille.zendesk.com");
				mimemsg.setRecipients(Message.RecipientType.BCC, "sarah@quickapostille.online");
				String customerEmail = contactDTO.getFirstName() + " " + contactDTO.getLastName() + "<" + contactDTO.getEmail() + ">";
				mimemsg.setFrom(new InternetAddress("noreply@quickapostille.online", customerEmail));
				mimemsg.setHeader("Reply-To", contactDTO.getEmail());
				mimemsg.setSubject(contactDTO.getSubject(), "UTF-8");

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
		return false;
	}

}
