<%@page import="com.entities.Class"%>
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

	
			<option value="" selected>Select Class</option>
			<%
			Session session1 = FactoryProvider.getSessionFactory().openSession();
			int specialization_id = Integer.parseInt(request.getParameter("id"));
			Query q = session1.createQuery("from Class p where p.specialization.specialization_id = :x");
			q.setParameter("x",specialization_id);
			List<Class> listofProfessors = q.list();
			for (Class p : listofProfessors) {
			%>
			<option value=<%=p.getClass_id()%>><%=p.getClass_name()%></option>
			<%
			}
			session1.close();
			%>