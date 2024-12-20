package com.example.superhim.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "blogdetail")
public class BlogDetailsPojo {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sn;
	@Column(length = 100)
	private String title;
	@Column(length = 5000)
	private String discription;
	@Column(length = 500)
	private String tag;
	@Column(length = 100)
	private String blogimagename;
	@Column(length = 50)
	private String datetime;
		
	public BlogDetailsPojo() {
		super();
	}

	public BlogDetailsPojo(String title, String discription, String tag, String blogimagename, String datetime) {
		super();
		this.title = title;
		this.discription = discription;
		this.tag = tag;
		this.blogimagename = blogimagename;
		this.datetime = datetime;
	}



	public int getSn() {
		return sn;
	}



	public void setSn(int sn) {
		this.sn = sn;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getDiscription() {
		return discription;
	}



	public void setDiscription(String discription) {
		this.discription = discription;
	}



	public String getTag() {
		return tag;
	}



	public void setTag(String tag) {
		this.tag = tag;
	}



	public String getBlogimagename() {
		return blogimagename;
	}



	public void setBlogimagename(String blogimagename) {
		this.blogimagename = blogimagename;
	}



	public String getDatetime() {
		return datetime;
	}



	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	
	
	
}
