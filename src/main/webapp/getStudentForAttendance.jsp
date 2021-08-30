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
			int class_id = Integer.parseInt(request.getParameter("id"));
			Class class1 = session1.get(Class.class,class_id);
		
			int i = 1;
			for (Student p : class1.getListofstudents()) {
				
			%>
<tr>
	<td>
		<div class="custom-control custom-checkbox">
			<input type="checkbox" class="custom-control-input" id="customCheck<%=i%>" value=<%=p.getStud_id()%>
				 name="student"> <label class="custom-control-label"
				for="customCheck<%=i%>"><%=i++ %></label>
		</div>
	</td>
	<td>
	<%=p.getName() %>
	</td>

</tr>
<%
			}
			session1.close();
			%>
