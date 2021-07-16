package com.model;

public class Item {
	private int item_num;
	private String item_name;
	private String item_content;
	private int item_price;
	private String item_img;
	private int item_count;
	
	
	
	@Override
	public String toString() {
		return "Item [item_num=" + item_num + ", item_name=" + item_name + ", item_content=" + item_content
				+ ", item_price=" + item_price + ", item_img=" + item_img + ", item_count=" + item_count + "]";
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_content() {
		return item_content;
	}
	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public String getItem_img() {
		return item_img;
	}
	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}
	public int getItem_count() {
		return item_count;
	}
	public void setItem_count(int item_count) {
		this.item_count = item_count;
	}
}
