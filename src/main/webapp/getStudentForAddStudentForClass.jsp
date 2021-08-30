<%@page import="com.entities.Student"%>
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
<%
			Session session1 = FactoryProvider.getSessionFactory().openSession();
			int specialization_id = Integer.parseInt(request.getParameter("id"));
			Query q = session1.createQuery("from Student p where p.specialization.specialization_id = :x");
			q.setParameter("x",specialization_id);
			List<Student> listofStudents = q.list();
			int i = 1;
			for (Student p : listofStudents) {
				
			%>
<tr>
	<td>
		<div class="custom-control custom-checkbox">
			<input type="checkbox" class="custom-control-input" id="customCheck<%=i%>" value=<%=p.getStud_id()%>
				 name="student"> <label class="custom-control-label"
				for="customCheck<%=i%>"><%=i++ %></label>
		</div>
	</td>
	<td><%=p.getName()%></td>

</tr>
<%
			}
			session1.close();
			%>
