<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deletion</title>
</head>
<body>

<%
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("University");
			String ent1 = request.getParameter("name");
			String ent2 = request.getParameter("number");
			//need a sport entity
			
			
			//DELETE FROM Customers
			//WHERE CustomerName='Alfreds Futterkiste';
			
			if (entity.equals("Select") || ent1.equals(" ") || ent2.equals(" ") ){
				//invalid
				out.print("<table>");
				out.print("<tr>");
				out.print("<td>Invalid Update</td>");
				
			} else {
				//execute deletion
				
				
			} //end if else
			
			
			//close the connection.
			con.close();
			
		} catch (Exception e) {
			out.print(e);
		}

%>
			













</body>
</html>