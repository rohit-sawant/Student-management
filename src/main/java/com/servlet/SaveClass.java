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

import com.entities.Professor;
import com.entities.Specialization;
import com.entities.Student;
import com.helper.FactoryProvider;



import com.entities.Class;


public class SaveClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveClass() {
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
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		int num_of_students = Integer.parseInt(request.getParameter("num_of_students"));
		int professor_id = Integer.parseInt(request.getParameter("professor"));
		int specialization_id = Integer.parseInt(request.getParameter("specialization"));
//		Note note = new Note(title,content, new Date());
		Session session = FactoryProvider.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Specialization specialization = (Specialization)session.get(Specialization.class, specialization_id);
		Professor professor =session.get(Professor.class,professor_id);
		String datetime = date+" "+ time;
		String originalStringFormat = "MM/dd/yyyy HH:mm";
		String desiredStringFormat = "yyyy-MM-dd HH:mm:ss";
		SimpleDateFormat readingFormat = new SimpleDateFormat(originalStringFormat);
		SimpleDateFormat outputFormat = new SimpleDateFormat(desiredStringFormat);
		Date dateformat = new Date();
		try {
			dateformat = readingFormat.parse(datetime);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Student> listofstudentList = new ArrayList();
		Class class1 = new Class( professor,name,specialization,num_of_students,dateformat);
		session.save(class1);
		transaction.commit();
		session.close();

		response.sendRedirect("/bcs");
	}

}
