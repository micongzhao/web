package com.ittx.studentmanager.bean;

public class Student {
	private String name;
	private int number;
	private int age;
	private boolean sex;
	private String fileUrl;

	public Student(){
		
	}
	public Student(String name, int number, int age, boolean sex,String url) {
		this.name = name;
		this.number = number;
		this.age = age;
		this.sex = sex;
		this.fileUrl = url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public boolean isSex() {
		return sex;
	}

	public void setSex(boolean sex) {
		this.sex = sex;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	@Override
	public String toString() {
		return "Student [name=" + name + ", number=" + number + ", age=" + age + ", sex=" + sex + "]";
	}
	
	
}
