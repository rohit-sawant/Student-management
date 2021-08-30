package com.entities;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import com.entities.*;

@Entity
public class Specialization {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int specialization_id;
	public Specialization( String specialization_name) {
		super();
		this.specialization_id = specialization_id;
		this.specialization_name = specialization_name;
	}
	public Specialization() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getSpecialization_id() {
		return specialization_id;
	}
	public void setSpecialization_id(int specialization_id) {
		this.specialization_id = specialization_id;
	}
	public String getSpecialization_name() {
		return specialization_name;
	}
	public void setSpecialization_name(String specialization_name) {
		this.specialization_name = specialization_name;
	}
	private String specialization_name;
}
