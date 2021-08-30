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

@Entity
public class Attendance {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int att_id;
	private Date date;
	private String subject;
	@OneToOne
	@JoinColumn(name="professor_id")
	private Professor profesor_id;
	private String professor_name;
	@OneToOne
	@JoinColumn(name="class_id")
	private Class class_id;
	@ManyToMany 
	@JoinTable(name = "Attendance_Present", 
    joinColumns = @JoinColumn(name = "attendance_id"), 
    inverseJoinColumns = @JoinColumn(name = "stud_id"))
	private List<Student> listofPresentStudents;
	
	@ManyToMany 
	@JoinTable(name = "Attendance_Absent", 
    joinColumns = @JoinColumn(name = "attendance_id"), 
    inverseJoinColumns = @JoinColumn(name = "stud_id"))
	private List<Student> listofAbsentStudents;
	@Override
	public String toString() {
		return "Attendance [att_id=" + att_id + ", date=" + date + ", subject=" + subject 
				+ ", profesor_id=" + profesor_id + ", professor_name=" + professor_name + ", class_id=" + class_id
				+ ", listofStudents=" + listofPresentStudents + "]";
	}
	public List<Student> getListofAbsentStudents() {
		return listofAbsentStudents;
	}
	public void setListofAbsentStudents(List<Student> listofAbsentStudents) {
		this.listofAbsentStudents = listofAbsentStudents;
	}
	public void setListofPresentStudents(List<Student> listofPresentStudents) {
		this.listofPresentStudents = listofPresentStudents;
	}
	public Attendance(Date date, String subject, Professor profesor_id, String professor_name, Class class_id,
			List<Student> listofPresentStudents, List<Student> listofAbsentStudents) {
		super();
		this.date = date;
		this.subject = subject;
		this.profesor_id = profesor_id;
		this.professor_name = professor_name;
		this.class_id = class_id;
		this.listofPresentStudents = listofPresentStudents;
		this.listofAbsentStudents = listofAbsentStudents;
	}
	
	public Attendance() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getAtt_id() {
		return att_id;
	}
	public void setAtt_id(int att_id) {
		this.att_id = att_id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Professor getProfesor_id() {
		return profesor_id;
	}
	public void setProfesor_id(Professor profesor_id) {
		this.profesor_id = profesor_id;
	}
	public String getProfessor_name() {
		return professor_name;
	}
	public void setProfessor_name(String professor_name) {
		this.professor_name = professor_name;
	}
	public Class getClass_id() {
		return class_id;
	}
	public void setClass_id(Class class_id) {
		this.class_id = class_id;
	}
	public List<Student> getListofPresentStudents() {
		return listofPresentStudents;
	}
	public void listofPresentStudents(List<Student> listofPresentStudents) {
		this.listofPresentStudents = listofPresentStudents;
	}
	
	
}
