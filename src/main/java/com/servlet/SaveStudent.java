package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Specialization;
import com.entities.Student;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveStudent
 */
public class SaveStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");

		String email = request.getParameter("email");

		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		int colg_year = Integer.parseInt(request.getParameter("colg_year"));
		int specialization_id = Integer.parseInt(request.getParameter("specialization"));
		String address = request.getParameter("address");
//		Note note = new Note(title,content, new Date());
		Session session = FactoryProvider.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Specialization specialization = (Specialization)session.get(Specialization.class, specialization_id);
		Student student = new Student( name,  email,  gender,  age,  colg_year,  specialization,address);
		session.save(student);
		transaction.commit();
		session.close();
		response.sendRedirect("/bcs");
	}

}
