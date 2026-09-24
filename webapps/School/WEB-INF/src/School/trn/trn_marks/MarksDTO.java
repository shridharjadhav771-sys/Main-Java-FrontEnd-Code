package School.trn.trn_marks;

public class MarksDTO {
	private int mark_id;
	private int student_id;
	private String name;
	private int subject_id;
	private String subject_name;
	private int exam_type_id;
	private String exam_name;
	private double marks;
	private int is_deleted;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public String getExam_name() {
		return exam_name;
	}
	public void setExam_name(String exam_name) {
		this.exam_name = exam_name;
	}
	public int getMark_id() {
		return mark_id;
	}
	public void setMark_id(int mark_id) {
		this.mark_id = mark_id;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public int getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(int subject_id) {
		this.subject_id = subject_id;
	}
	public int getExam_type_id() {
		return exam_type_id;
	}
	public void setExam_type_id(int exam_type_id) {
		this.exam_type_id = exam_type_id;
	}
	public double getMarks() {
		return marks;
	}
	public void setMarks(double marks) {
		this.marks = marks;
	}
	public int getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(int is_deleted) {
		this.is_deleted = is_deleted;
	}
	
	
}
