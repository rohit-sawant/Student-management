<%@page import="java.math.BigInteger"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.query.NativeQuery"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%

Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> barChartList = new ArrayList<Map<Object,Object>>();
Session session1 = FactoryProvider.getSessionFactory().openSession();
int student_id=Integer.parseInt(request.getParameter("id"));
String sql;
sql ="SELECT class.class_name,COUNT(attendance_present.stud_id) as count FROM attendance_present INNER JOIN attendance ON attendance_present.attendance_id=attendance.att_id INNER JOIN class on class.class_id = attendance.class_id INNER JOIN student ON\r\n"
		+ "student.stud_id=attendance_present.stud_id WHERE student.stud_id = "+student_id+" GROUP by class.class_id,attendance_present.stud_id,student.stud_id";

NativeQuery query  = session1.createSQLQuery(sql);
List<Object[]> list = query.list();

for(Object[] student:list) {
	Integer i = ((BigInteger) student[1]).intValue();
	map = new HashMap<Object,Object>();
	map.put("label", (String)student[0]); 
	map.put("y",i ); 
	barChartList.add(map);
}
 
String dataPoints = gsonObj.toJson(barChartList);
out.println(dataPoints);
%>
 
   