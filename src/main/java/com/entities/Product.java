package com.entities;

import javax.persistence.*;
@Entity
public class Product {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int pPid;
	private String pName;
	@Column(length = 3000)
	private String pDescription;
	private String pPhoto;
	private int pPrice;
	private int pDiscount;
	private int pQuanity;
	@ManyToOne
	@JoinColumn(name="catID")
	private Category category;
	public int getpPid() {
		return pPid;
	}
	public void setpPid(int pPid) {
		this.pPid = pPid;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpDescription() {
		return pDescription;
	}
	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}
	public String getpPhoto() {
		return pPhoto;
	}
	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public int getpDiscount() {
		return pDiscount;
	}
	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}
	public int getpQuanity() {
		return pQuanity;
	}
	public void setpQuanity(int pQuanity) {
		this.pQuanity = pQuanity;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product( String pName, String pDescription, String pPhoto, int pPrice, int pDiscount, int pQuanity,
			Category category) {
		super();
		//this.pPid = pPid;
		this.pName = pName;
		this.pDescription = pDescription;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuanity = pQuanity;
		this.category = category;
	}
	public Product(String pName, String pDescription, String pPhoto, int pPrice, int pDiscount, int pQuanity) {
		super();
		this.pName = pName;
		this.pDescription = pDescription;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuanity = pQuanity;
	}
	public Product(int pPid, String pName, String pDescription, String pPhoto, int pPrice, int pDiscount,
			int pQuanity) {
		super();
		this.pPid = pPid;
		this.pName = pName;
		this.pDescription = pDescription;
		this.pPhoto = pPhoto;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pQuanity = pQuanity;
	}
	@Override
	public String toString() {
		return "Product [pPid=" + pPid + ", pName=" + pName + ", pPrice=" + pPrice + ", pQuanity=" + pQuanity + "]";
	}
	
	
	
	
	
	
	

}
