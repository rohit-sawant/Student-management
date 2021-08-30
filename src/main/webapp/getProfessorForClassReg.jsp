<%@page import="com.entities.Professor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="javax.servlet.ServletException,javax.servlet.*,com.helper.FactoryProvider,org.hibernate.*"%><%@page
	import="java.util.List"%>
<%@page import="com.entities.Specialization"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>

	
			<option value="" selected>Select specialization</option>
			<%
			Session session1 = FactoryProvider.getSessionFactory().openSession();
			Transaction transaction = session1.beginTransaction();
			int specialization_id = Integer.parseInt(request.getParameter("id"));
			Specialization specialization = session1.get(Specialization.class, specialization_id);
			Query q = session1.createQuery("from Professor p where p.specialization.specialization_id = :x");
			q.setParameter("x",specialization_id);
			List<Professor> listofProfessors = q.list();
			for (Professor p : listofProfessors) {
			%>
			<option value=<%=p.getProfessor_id()%>><%=p.getProf_name()%></option>
			<%
			}
			transaction.commit();
			session1.close();
			%>
		

