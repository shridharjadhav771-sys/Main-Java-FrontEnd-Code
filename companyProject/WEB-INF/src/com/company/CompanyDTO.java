package com.company;

public class CompanyDTO {

	int stdId = 0;
	String studentFirstName = "";
	String studentLastName = "";
	String studentEmailId = "";
	String studentAddress = "";
	public int getStdId() {
		return stdId;
	}
	public void setStdId(int stdId) {
		this.stdId = stdId;
	}
	public String getStudentFirstName() {
		return studentFirstName;
	}
	public void setStudentFirstName(String studentFirstName) {
		this.studentFirstName = studentFirstName;
	}
	public String getStudentLastName() {
		return studentLastName;
	}
	public void setStudentLastName(String studentLastName) {
		this.studentLastName = studentLastName;
	}
	public String getStudentEmailId() {
		return studentEmailId;
	}
	public void setStudentEmailId(String studentEmailId) {
		this.studentEmailId = studentEmailId;
	}
	public String getStudentAddress() {
		return studentAddress;
	}
	public void setStudentAddress(String studentAddress) {
		this.studentAddress = studentAddress;
	}
	public CompanyDTO(int stdId, String studentFirstName, String studentLastName, String studentEmailId,
			String studentAddress) {
		super();
		this.stdId = stdId;
		this.studentFirstName = studentFirstName;
		this.studentLastName = studentLastName;
		this.studentEmailId = studentEmailId;
		this.studentAddress = studentAddress;
	}
	public CompanyDTO() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "CompanyDTO [stdId=" + stdId + ", studentFirstName=" + studentFirstName + ", studentLastName="
				+ studentLastName + ", studentEmailId=" + studentEmailId + ", studentAddress=" + studentAddress
				+ ", getStdId()=" + getStdId() + ", getStudentFirstName()=" + getStudentFirstName()
				+ ", getStudentLastName()=" + getStudentLastName() + ", getStudentEmailId()=" + getStudentEmailId()
				+ ", getStudentAddress()=" + getStudentAddress() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
