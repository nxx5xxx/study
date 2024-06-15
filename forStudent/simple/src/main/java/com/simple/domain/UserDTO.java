package com.simple.domain;

public class UserDTO {
	private String no;
	private String id;
	private String passwd;
	private String name;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public UserDTO(String id, String passwd, String name) {
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public UserDTO(String no, String id, String passwd, String name) {
		super();
		this.no = no;
		this.id = id;
		this.passwd = passwd;
		this.name = name;
	}
	
	public UserDTO() {
		super();
	}
	@Override
	public String toString() {
		return "UserDTO [no=" + no + ", id=" + id + ", passwd=" + passwd + ", name=" + name + "]";
	}
	
}
