package com.entities;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import org.apache.jasper.compiler.NewlineReductionServletWriter;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.hql.internal.ast.tree.SessionFactoryAwareNode;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;

import com.helper.FactoryProvider;

import java.util.List;
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;  
public class FetchDefaultor {
public static void main(String[] args) {
//	class -> get students from the class -> create a check box -> all clicked will be saved in attendance.
	Session session = FactoryProvider.getSessionFactory().openSession();
	int class_id = 18;
	String sql;
	sql ="SELECT "
			+ "class.class_name,student.name,professor.contact_no,professor.prof_name,attendance_absent.stud_id,count(attendance_absent.stud_id) as cnt "
			+ "FROM attendance_absent "
			+ "INNER JOIN attendance "
			+ "ON attendance_absent.attendance_id = attendance.att_id "
			+ "INNER JOIN student "
			+ "ON student.stud_id=attendance_absent.stud_id "
			+ "INNER JOIN professor "
			+ "on professor.professor_id = attendance.professor_id "
			+ "INNER JOIN class "
			+ "ON class.class_id = attendance.class_id "
			+ "WHERE attendance.class_id="+class_id+" "
			+ " GROUP BY attendance_absent.stud_id HAVING COUNT(attendance_absent.stud_id)>0";
	
	NativeQuery query  = session.createSQLQuery(sql);
	List<Object[]> list = query.list();
	for(Object[] student:list) {
		System.out.println(Arrays.toString(student));
	}
	
	session.close();
	
}
}
