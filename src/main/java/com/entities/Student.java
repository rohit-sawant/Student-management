package com.entities;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;




@Entity
public class Student {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int stud_id;
	private String name;
	private String email;
	private String gender;
	private int age;
	private int colg_year;
	@OneToOne
	@JoinColumn(name="specialization")
	private Specialization specialization;
	private String address;
	public Student( String name, String email, String gender, int age, int colg_year,
			Specialization specialization, String address) {
		super();
		
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.age = age;
		this.colg_year = colg_year;
		this.specialization = specialization;
		this.address = address;
	}
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getStud_id() {
		return stud_id;
	}
	public void setStud_id(int stud_id) {
		this.stud_id = stud_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getColg_year() {
		return colg_year;
	}
	public void setColg_year(int colg_year) {
		this.colg_year = colg_year;
	}
	
	@Override
	public String toString() {
		return "Student [stud_id=" + stud_id + ", name=" + name + ", email=" + email + ", gender=" + gender + ", age="
				+ age + ", colg_year=" + colg_year + ", specialization=" + specialization
				+ ", address=" + address + "]";
	}
	
	public Specialization getSpecialization() {
		return specialization;
	}
	public void setSpecialization(Specialization specialization) {
		this.specialization = specialization;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
}
