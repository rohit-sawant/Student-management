package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Professor {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int professor_id;
	private String prof_email;
	private String prof_name;
	private int age;
	private int contact_no;
	@OneToOne
	@JoinColumn(name = "specialization")
	private Specialization specialization;
	public Professor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Professor(String prof_email, String prof_name, int age, int contact_no, Specialization specialization) {
		super();
		this.prof_email = prof_email;
		this.prof_name = prof_name;
		this.age = age;
		this.contact_no = contact_no;
		this.specialization = specialization;
	}
	public int getProfessor_id() {
		return professor_id;
	}
	public void setProfessor_id(int professor_id) {
		this.professor_id = professor_id;
	}
	public String getProf_email() {
		return prof_email;
	}
	public void setProf_email(String prof_email) {
		this.prof_email = prof_email;
	}
	public String getProf_name() {
		return prof_name;
	}
	public void setProf_name(String prof_name) {
		this.prof_name = prof_name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getContact_no() {
		return contact_no;
	}
	public void setContact_no(int contact_no) {
		this.contact_no = contact_no;
	}
	public Specialization getSpecialization() {
		return specialization;
	}
	public void setSpecialization(Specialization specialization) {
		this.specialization = specialization;
	}

}
