package com.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.secure.internal.JaccPreUpdateEventListener;

import com.entities.Attendance;
import com.entities.Class;
import com.entities.Professor;
import com.entities.Student;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveAttendance
 */
public class SaveAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveAttendance() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String student[]=  request.getParameterValues("student");

		String nameString = request.getParameter("name");
		Session session = FactoryProvider.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();

		List<Student> listofPresentStudents = new ArrayList<Student>();

		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String datetime = date+" "+ time;
		Date date1 = new Date();
		try {
			date1=new SimpleDateFormat("MM/dd/yyyy HH:mm").parse(datetime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(String s:student) {
			listofPresentStudents.add(session.get(Student.class,Integer.parseInt(s)));
		}

		Class class1 = session.get(Class.class,Integer.parseInt(request.getParameter("class")));

		List<Student> listofAbsentStudents = new ArrayList<Student>(class1.getListofstudents());

		listofAbsentStudents.removeAll(listofPresentStudents);
		Professor professor = class1.getProfessor_id();
		Attendance attendance = new Attendance(date1, nameString, professor, professor.getProf_name(), class1,listofPresentStudents,listofAbsentStudents);
		System.out.println(attendance);
		session.save(attendance);
		transaction.commit();
		session.close();
		response.sendRedirect("Attendance.jsp");
	}

}
