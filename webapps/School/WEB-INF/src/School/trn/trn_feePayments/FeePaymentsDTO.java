package School.trn.trn_feePayments;

import java.sql.Date;

public class FeePaymentsDTO {
	private int payment_id;
	private int student_id;
	private int fee_type_id;
	private double amount_paid;
	private Date payment_date;
	private int is_deleted;
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public int getFee_type_id() {
		return fee_type_id;
	}
	public void setFee_type_id(int fee_type_id) {
		this.fee_type_id = fee_type_id;
	}
	public double getAmount_paid() {
		return amount_paid;
	}
	public void setAmount_paid(double amount_paid) {
		this.amount_paid = amount_paid;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public int getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(int is_deleted) {
		this.is_deleted = is_deleted;
	}
	
	
}
