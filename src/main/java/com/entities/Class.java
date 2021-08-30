package com.entities;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import com.entities.*;



@Entity
public class Class {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int class_id;
	
	@OneToOne
	@JoinColumn(name="professor_id")
	private Professor professor_id;
	private String class_name;
	
	@OneToOne
	@JoinColumn(name="specialization_id")
	private Specialization specialization;
	private int num_of_students;
	
	@ManyToMany 
	@JoinTable(name = "Class_Student", 
    joinColumns = @JoinColumn(name = "class_id"), 
    inverseJoinColumns = @JoinColumn(name = "student_id"))
	private List<Student> listofstudents;

	private Date timing;

	public Class() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Class( Professor professor_id, String class_name, Specialization specialization,
			int num_of_students,  Date timing) {
		super();
		this.professor_id = professor_id;
		this.class_name = class_name;
		this.specialization = specialization;
		this.num_of_students = num_of_students;
//		this.listofstudents = listofstudents;
		this.timing = timing;
	}

	public int getClass_id() {
		return class_id;
	}

	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}

	public Professor getProfessor_id() {
		return professor_id;
	}

	public void setProfessor_id(Professor professor_id) {
		this.professor_id = professor_id;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public Specialization getSpecialization() {
		return specialization;
	}

	public void setSpecialization(Specialization specialization) {
		this.specialization = specialization;
	}

	public int getNum_of_students() {
		return num_of_students;
	}

	public void setNum_of_students(int num_of_students) {
		this.num_of_students = num_of_students;
	}

	public List<Student> getListofstudents() {
		return listofstudents;
	}

	public void setListofstudents(List<Student> listofstudents) {
		this.listofstudents = listofstudents;
	}

	public Date getTiming() {
		return timing;
	}

	public void setTiming(Date timing) {
		this.timing = timing;
	}
	
		
}
