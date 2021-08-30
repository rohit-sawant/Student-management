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
 * Servlet implementation class SaveSpecialization
 */
public class SaveSpecialization extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveSpecialization() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		Specialization specialization = new Specialization( name);
		Session session = FactoryProvider.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.save(specialization);
		transaction.commit();
		session.close();

		response.sendRedirect("/bcs");
	}

}
