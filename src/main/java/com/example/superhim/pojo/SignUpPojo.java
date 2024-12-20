package com.example.superhim.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "signup")
public class SignUpPojo {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sn;
	@Column(length = 30)
	private String fullname;
	@Column(length = 12)
	private String mobile;
	@Column(length = 30)
	private String email;
	@Column(length = 30)
	private String password;
	@Column(length = 30)
	private String dateTime;
	
	public SignUpPojo() {
		super();
	}
	public SignUpPojo(String fullname, String mobile,String email, String password,String dateTime) {
		super();
		this.fullname = fullname;
		this.mobile = mobile;
		this.email = email;
		this.password = password;
		this.dateTime = dateTime;
	}
	public int getSn() {
		return sn;
	}
	public void setSn(int sn) {
		this.sn = sn;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getUsername() {
		return email;
	}
	public void setUsername(String username) {
		this.email = username;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDateTime() {
		return dateTime;
	}
	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}
	
}
