package com.globecreater.dto;

public class ItemCategoryDTO {
	
	private int item_category_id;
	private String category_name;
	private String category_code;
	private int item_group;
	private String item_group_name;
	private String is_active;
	
	public String getItem_group_name() {
		return item_group_name;
	}
	public void setItem_group_name(String item_group_name) {
		this.item_group_name = item_group_name;
	}
	public int getItem_category_id() {
		return item_category_id;
	}
	public void setItem_category_id(int item_category_id) {
		this.item_category_id = item_category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public int getItem_group() {
		return item_group;
	}
	public void setItem_group(int item_group) {
		this.item_group = item_group;
	}
	public String getIs_active() {
		return is_active;
	}
	public void setIs_active(String is_active) {
		this.is_active = is_active;
	}
}
