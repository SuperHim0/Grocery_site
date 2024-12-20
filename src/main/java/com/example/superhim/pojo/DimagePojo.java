package com.example.superhim.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//@Entity
//@Table(name = "3dimage")
public class DimagePojo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sn;
	@Column(length = 100)
	private String producttital ;
	@Column(length = 1000)
	private String productdescription ;
	@Column(length = 20)
	private	String crossprice;
	@Column (length = 20)
	private String mainprice ;
	@Column(length = 30)
	private	String availability ;
	@Column(length = 30)
	private	String department ;
	@Column(length = 30)
	private	String category ;
	@Column(length = 500)
	private String productimage;
	@Column(length = 500)
	private String product3dimage;
	@Column(length = 30)
	private String datetime;

	public DimagePojo() {
		super();
	}


	public DimagePojo(String producttital, String productdescription, String crossprice, String mainprice,
			String availability, String department, String category, String productimage, String product3dimage,
			String datetime) {
		super();
		this.producttital = producttital;
		this.productdescription = productdescription;
		this.crossprice = crossprice;
		this.mainprice = mainprice;
		this.availability = availability;
		this.department = department;
		this.category = category;
		this.productimage = productimage;
		this.product3dimage = product3dimage;
		this.datetime = datetime;
	}


	public int getSn() {
		return sn;
	}

	public void setSn(int sn) {
		this.sn = sn;
	}

	public String getProducttital() {
		return producttital;
	}

	public void setProducttital(String producttital) {
		this.producttital = producttital;
	}

	public String getProductdescription() {
		return productdescription;
	}

	public void setProductdescription(String productdescription) {
		this.productdescription = productdescription;
	}

	public String getCrossprice() {
		return crossprice;
	}

	public void setCrossprice(String crossprice) {
		this.crossprice = crossprice;
	}

	public String getMainprice() {
		return mainprice;
	}

	public void setMainprice(String mainprice) {
		this.mainprice = mainprice;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getProductimage() {
		return productimage;
	}

	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}

	public String getProduct3dimage() {
		return product3dimage;
	}

	public void setProduct3dimage(String product3dimage) {
		this.product3dimage = product3dimage;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	
}
