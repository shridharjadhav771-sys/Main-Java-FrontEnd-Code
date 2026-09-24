
import java.sql.Date;

public class RegisterDTO {
	int reg_id = 0;
	String reg_fname = "";
	String reg_lname = "";
	long reg_mbno = 0;
	String reg_emailid = "";
	String reg_address = "";
	String reg_gender = "";
	Date reg_dob;
	String reg_branch = "";
	String reg_specialization = "";
	int reg_isdelete = 0;
	String reg_Password = "";

	public RegisterDTO() {

	}

	public RegisterDTO(int reg_id, String reg_fname, String reg_lname, long reg_mbno, String reg_emailid,
			String reg_address, String reg_gender, Date reg_dob, String reg_branch, String reg_specialization,
			int reg_isdelete, String reg_Password) {
		this.reg_id = reg_id;
		this.reg_fname = reg_fname;
		this.reg_lname = reg_lname;
		this.reg_mbno = reg_mbno;
		this.reg_emailid = reg_emailid;
		this.reg_address = reg_address;
		this.reg_gender = reg_gender;
		this.reg_dob = reg_dob;
		this.reg_branch = reg_branch;
		this.reg_specialization = reg_specialization;
		this.reg_isdelete = reg_isdelete;
		this.reg_Password = reg_Password;
	}

	public int getReg_id() {
		return reg_id;
	}

	public void setReg_id(int reg_id) {
		this.reg_id = reg_id;
	}

	public String getReg_fname() {
		return reg_fname;
	}

	public void setReg_fname(String reg_fname) {
		this.reg_fname = reg_fname;
	}

	public String getReg_lname() {
		return reg_lname;
	}

	public void setReg_lname(String reg_lname) {
		this.reg_lname = reg_lname;
	}

	public long getReg_mbno() {
		return reg_mbno;
	}

	public void setReg_mbno(long reg_mbno) {
		this.reg_mbno = reg_mbno;
	}

	public String getReg_emailid() {
		return reg_emailid;
	}

	public void setReg_emailid(String reg_emailid) {
		this.reg_emailid = reg_emailid;
	}

	public String getReg_address() {
		return reg_address;
	}

	public void setReg_address(String reg_address) {
		this.reg_address = reg_address;
	}

	public String getReg_gender() {
		return reg_gender;
	}

	public void setReg_gender(String reg_gender) {
		this.reg_gender = reg_gender;
	}

	public Date getReg_dob() {
		return reg_dob;
	}

	public void setReg_dob(Date reg_dob) {
		this.reg_dob = reg_dob;
	}

	public String getReg_branch() {
		return reg_branch;
	}

	public void setReg_branch(String reg_branch) {
		this.reg_branch = reg_branch;
	}

	public String getReg_specialization() {
		return reg_specialization;
	}

	public void setReg_specialization(String reg_specialization) {
		this.reg_specialization = reg_specialization;
	}

	public int getReg_isdelete() {
		return reg_isdelete;
	}

	public void setReg_isdelete(int reg_isdelete) {
		this.reg_isdelete = reg_isdelete;
	}

	public String getReg_Password() {
		return reg_Password;
	}

	public void setReg_Password(String reg_Password) {
		this.reg_Password = reg_Password;

	}
}
