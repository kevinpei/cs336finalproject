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
			String ent0 = request.getParameter("sport");
		
			String str = null;
			String str1 = null;
			
			//DELETE FROM Customers
			//WHERE CustomerName='Alfreds Futterkiste';
			
			if (entity.equals("Select") || ent0.equals("Select") || ent1 == "" || ent2 == "" ){
				//invalid
				out.print("<table>");
				out.print("<tr>");
				out.print("<td>Invalid Update</td>");
				
			} else {
				//execute deletion
					// DELETE FROM table_name
					// WHERE condition; 
				
				if (ent0.equals("Basketball")){ //name is ent1, school is entity, number is ent2 
					str = "DELETE FROM cs336project.PlaysForB WHERE NAME = \"" + ent1 + "\" AND SCHOOL = \"" + entity + "\" AND NO = \"" + ent2 + "\"";
					str1 = "DELETE FROM cs336project.PlayerData WHERE NAME = \"" + ent1 + "\" AND SCHOOL = \"" + entity + "\"";
				
				} else { //football, name is ent1, school is entity, number is ent2 
					str = "DELETE FROM cs336project.PlaysForF WHERE NAME = \"" + ent1 + "\" AND SCHOOL = \"" + entity + "\" AND NO = \"" + ent2 + "\"";
					str1 = "DELETE FROM cs336project.PlayerData WHERE NAME = \"" + ent1 + "\" AND SCHOOL = \"" + entity + "\"";
			
				} //end if else
					
				out.print("<table>");
				out.print("<tr>");
				out.print("<td>Deletion Successful</td>");
					
				//Run the query against the database.
				int result = stmt.executeUpdate(str);
				int result1 = stmt.executeUpdate(str1);
				
			} //end if else
			
			
			//close the connection.
			con.close();
			
		} catch (Exception e) {
			out.print(e);
		}

%>
			













</body>
</html>