package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Professor;
import com.entities.Specialization;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class SaveProfessor
 */
public class SaveProfessor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveProfessor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");

		String email = request.getParameter("email");
		int contact = Integer.parseInt(request.getParameter("contact"));
		int age = Integer.parseInt(request.getParameter("age"));
		int specialization_id = Integer.parseInt(request.getParameter("specialization"));
//		Note note = new Note(title,content, new Date());
		Session session = FactoryProvider.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Specialization specialization = (Specialization)session.get(Specialization.class, specialization_id);

		Professor professor = new Professor(  email, name,  age,  contact,  specialization);
		session.save(professor);
		transaction.commit();
		session.close();

		response.sendRedirect("/bcs");
	}

}
