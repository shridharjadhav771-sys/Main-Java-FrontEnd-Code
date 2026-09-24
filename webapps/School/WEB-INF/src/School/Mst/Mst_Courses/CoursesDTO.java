package School.Mst.Mst_Courses;

public class CoursesDTO {
	
	private int course_id;
	private String course_name;
	private int is_deleted;
	private String course_duration;
	
	public String getCourse_duration() {
		return course_duration;
	}
	public void setCourse_duration(String course_duration) {
		this.course_duration = course_duration;
	}
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	public int getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(int is_deleted) {
		this.is_deleted = is_deleted;
	}
	
	
}
