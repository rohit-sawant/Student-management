package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Class;
import com.entities.Specialization;
import com.entities.Student;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class AddStudentToClass
 */
public class AddStudentToClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudentToClass() {
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
		String student[]=  request.getParameterValues("student");

		Session session = FactoryProvider.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		List<Student> listofStudents = new ArrayList<Student>();
		for(String s:student) {
			listofStudents.add(session.get(Student.class,Integer.parseInt(s)));
		}

		Class class1 = session.get(Class.class,Integer.parseInt(request.getParameter("class")));
		class1.setListofstudents(listofStudents);
		class1.setNum_of_students(listofStudents.size());
		session.update(class1);
		transaction.commit();
		session.close();
		response.sendRedirect("addstudentforclass.jsp");
	}

}
