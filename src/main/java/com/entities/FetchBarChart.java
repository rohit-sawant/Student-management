package com.entities;

import java.util.Arrays;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.NativeQuery;

import com.helper.FactoryProvider;

public class FetchBarChart {
public static void main(String[] args){
	Session session = FactoryProvider.getSessionFactory().openSession();
	int student_id=14;
	String sql;
	sql ="SELECT class.class_name,COUNT(attendance_present.stud_id) as count FROM attendance_present INNER JOIN attendance ON attendance_present.attendance_id=attendance.att_id INNER JOIN class on class.class_id = attendance.class_id INNER JOIN student ON\r\n"
			+ "student.stud_id=attendance_present.stud_id WHERE student.stud_id = "+student_id+" GROUP by class.class_id,attendance_present.stud_id,student.stud_id";
	
	NativeQuery query  = session.createSQLQuery(sql);
	List<Object[]> list = query.list();
	for(Object[] student:list) {
		int i=(int)student[1];
		System.out.println(student[0]+" "+i);
	}
	
	session.close();
}
}
