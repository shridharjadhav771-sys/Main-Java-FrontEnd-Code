package com.globecreater.dto;

public class BrandDTO {

	private int brand_id;
	public int getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(int brand_id) {
		this.brand_id = brand_id;
	}
	public int getCompany_id() {
		return company_id;
	}
	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getBrand_description() {
		return brand_description;
	}
	public void setBrand_description(String brand_description) {
		this.brand_description = brand_description;
	}
	public String getIs_active() {
		return is_active;
	}
	public void setIs_active(String is_active) {
		this.is_active = is_active;
	}
	private int company_id;
	private String brand_name;
	private String brand_description;
	private String is_active;

}
