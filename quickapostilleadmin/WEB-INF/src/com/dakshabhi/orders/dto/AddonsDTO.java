package com.dakshabhi.orders.dto;

public class AddonsDTO {
	private int id;
	private String addon_name;
	private double default_price;
	private double us_price;
	private double uae_price;
	private double gbp_price;
	private double euro_price;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAddon_name() {
		return addon_name;
	}
	public void setAddon_name(String addon_name) {
		this.addon_name = addon_name;
	}
	public double getDefault_price() {
		return default_price;
	}
	public void setDefault_price(double default_price) {
		this.default_price = default_price;
	}
	public double getUs_price() {
		return us_price;
	}
	public void setUs_price(double us_price) {
		this.us_price = us_price;
	}
	public double getUae_price() {
		return uae_price;
	}
	public void setUae_price(double uae_price) {
		this.uae_price = uae_price;
	}
	public double getGbp_price() {
		return gbp_price;
	}
	public void setGbp_price(double gbp_price) {
		this.gbp_price = gbp_price;
	}
	public double getEuro_price() {
		return euro_price;
	}
	public void setEuro_price(double euro_price) {
		this.euro_price = euro_price;
	}
	
}
