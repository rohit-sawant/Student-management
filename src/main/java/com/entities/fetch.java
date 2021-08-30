package com.entities;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import org.apache.jasper.compiler.NewlineReductionServletWriter;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.hql.internal.ast.tree.SessionFactoryAwareNode;
import org.hibernate.query.Query;

import com.helper.FactoryProvider;

import java.util.List;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;  
public class fetch {
public static void main(String[] args) {
//	class -> get students from the class -> create a check box -> all clicked will be saved in attendance.
	Session session = FactoryProvider.getSessionFactory().openSession();
	Transaction transaction = session.beginTransaction();
	Class class1 =session.get(Class.class, 42);
	Professor professor = class1.getProfessor_id();
	Student stud1 = session.get(Student.class,21 );
	Student stud2 = session.get(Student.class, 23);
	Student stud3 = session.get(Student.class, 22);
	List<Student> listofPresentStudents = new ArrayList<Student>(Arrays.asList(stud2,stud3));
	List<Student> listofAllStudents = new ArrayList<Student>(Arrays.asList(stud1,stud2,stud3));
	List<Student> listofAbsentStudents = new ArrayList<Student>(listofAllStudents);
	listofAbsentStudents.removeAll(listofPresentStudents);
	Attendance attendance = new Attendance(new Date(), "subject1", professor, professor.getProf_name(), class1,listofPresentStudents,listofAbsentStudents);
	System.out.println(listofAbsentStudents);
	session.save(attendance);
	transaction.commit();
	session.close();
	
}
}
