<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Basketball Queries</title>
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
			String entity = request.getParameter("Bbb");
			String ent1 = request.getParameter("Ppp");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT b.NO, b.NAME, b.POS, b.POINTS, b.ASSISTS, b.REBOUNDS, b.TURNOVERS, b.STEALS, b.FOULS FROM cs336project.PlaysForB b WHERE b.SCHOOL = \"" + entity + "\"";
		
			if(ent1.equals("C") || ent1.equals("F") || ent1.equals("G")){
				str = "SELECT b.NO, b.NAME, b.POS, b.POINTS, b.ASSISTS, b.REBOUNDS, b.TURNOVERS, b.STEALS, b.FOULS FROM cs336project.PlaysForB b WHERE b.SCHOOL = \"" + entity + "\" AND b.POS = \"" + ent1 + "\""; 
			}//end position if statement
		
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			
			//Make an HTML table to show the results in:
			out.print("<table>");
			
			//make a row
			out.print("<tr>");
			//make a column 1
			out.print("<td>NO</td>");
			//make a column
			out.print("<td>NAME</td>");
			//make a column
			out.print("<td>POSITION</td>");
			
			//make a column
			out.print("<td>POINTS</td>");
			//make a column
			out.print("<td>ASSISTS</td>");
			//make a column
			out.print("<td>REBOUNDS</td>");
			//make a column
			out.print("<td>TURNOVERS</td>");
			//make a column
			out.print("<td>STEALS</td>");
			//make a column
			out.print("<td>FOULS</td>");
			
			out.print("</tr>");
			

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>" + result.getString("NO") + "</td>");
				//make a column
				out.print("<td>" + result.getString("NAME") + "</td>");
				//make a column
				out.print("<td>" + result.getString("POS") + "</td>");
				
				
				//make a column
				out.print("<td>" + result.getString("POINTS") + "</td>");
				//make a column
				out.print("<td>" + result.getString("ASSISTS") + "</td>");
				//make a column
				out.print("<td>" + result.getString("REBOUNDS") + "</td>");
				//make a column
				out.print("<td>" + result.getString("TURNOVERS") + "</td>");
				//make a column
				out.print("<td>" + result.getString("STEALS") + "</td>");
				//make a column
				out.print("<td>" + result.getString("FOULS") + "</td>");
				
				
				out.print("</tr>");
				
			}
			out.print("</table>");

			//close the connection.
			con.close();
			
		} catch (Exception e) {
			out.print(e);
		}

	%>
			
</body>
</html>