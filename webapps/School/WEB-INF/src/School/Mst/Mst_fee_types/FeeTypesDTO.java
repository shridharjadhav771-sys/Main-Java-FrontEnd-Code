package School.Mst.Mst_fee_types;

public class FeeTypesDTO {
	private int fee_type_id;
	private String fee_name;
	private int is_deleted;
	public int getFee_type_id() {
		return fee_type_id;
	}
	public void setFee_type_id(int fee_type_id) {
		this.fee_type_id = fee_type_id;
	}
	public String getFee_name() {
		return fee_name;
	}
	public void setFee_name(String fee_name) {
		this.fee_name = fee_name;
	}
	public int getIs_deleted() {
		return is_deleted;
	}
	public void setIs_deleted(int is_deleted) {
		this.is_deleted = is_deleted;
	}
	
}
