package com.ssm.demo.pojo;

import java.util.Date;

public class UserDetaile {
	private int userid;
	private String username;
	private String sex;
	private Date birthday;
	private String address;
	private String head_img;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHead_img() {
		return head_img;
	}
	public void setHead_img(String head_img) {
		this.head_img = head_img;
	}
	@Override
	public String toString() {
		return "UserDetaile [userid=" + userid + ", username=" + username + ", sex=" + sex + ", birthday=" + birthday
				+ ", address=" + address + ", head_img=" + head_img + "]";
	}
}
