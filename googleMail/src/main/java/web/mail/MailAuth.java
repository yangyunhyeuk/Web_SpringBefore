package web.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {

	PasswordAuthentication pa;

	public MailAuth() {
		String mail_id = "���� �����ּ�";
		String mail_pw = "���� ��й�ȣ";

		pa = new PasswordAuthentication(mail_id, mail_pw);
	}

	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}