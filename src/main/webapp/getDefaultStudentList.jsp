<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.NativeQuery"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Session session1 = FactoryProvider.getSessionFactory().openSession();
int class_id = Integer.parseInt(request.getParameter("id"));
String sql;
sql ="SELECT "
		+ "class.class_name,student.name,professor.contact_no,professor.prof_name,attendance_absent.stud_id,count(attendance_absent.stud_id) as cnt "
		+ "FROM attendance_absent "
		+ "INNER JOIN attendance "
		+ "ON attendance_absent.attendance_id = attendance.att_id "
		+ "INNER JOIN student "
		+ "ON student.stud_id=attendance_absent.stud_id "
		+ "INNER JOIN professor "
		+ "on professor.professor_id = attendance.professor_id "
		+ "INNER JOIN class "
		+ "ON class.class_id = attendance.class_id "
		+ "WHERE attendance.class_id="+class_id+" "
		+ " GROUP BY attendance_absent.stud_id HAVING COUNT(attendance_absent.stud_id)>5";

NativeQuery query  = session1.createSQLQuery(sql);
List<Object[]> list = query.list();
for(Object[] student:list) {%>
<tr>
	<td><%=student[4] %></td>
	<td><%=student[1] %></td>
	<td><%=student[0] %></td>
	<td><%=student[3] %></td>
	<td><%=student[2] %></td>
</tr>

<% 
}

session1.close();
%>
</body>
</html>