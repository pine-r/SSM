package com.ssm.demo.pojo;

public class User {
	private int id;
	private String account;
	private String password;
	private UserDetaile userDetaile;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public UserDetaile getUserDetaile() {
		return userDetaile;
	}
	public void setUserDetaile(UserDetaile userDetaile) {
		this.userDetaile = userDetaile;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", account=" + account + ", password=" + password + ", userDetaile=" + userDetaile
				+ "]";
	}	
}
