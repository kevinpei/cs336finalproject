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
			String entity = request.getParameter("FUniversity");
			String ent1 = request.getParameter("FPosition");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM cs336project.PlaysForF f WHERE ";
			if (!entity.equals("All")) {
				str += "f.SCHOOL = \"" + entity + "\" AND ";
			}
			if(!ent1.equals("All")){
				str += "f.POS = \"" + ent1 + "\""; 
			}//end position if statement
			if (str.substring(str.length() - 5).equals(" AND "))
				str = str.substring(0, str.length() - 5);
			if (str.substring(str.length() - 7).equals(" WHERE "))
				str = str.substring(0, str.length() - 7);
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			%>
			<form method="post" action="football_index.jsp">
		    <button type="submit" name="command" value="Back">Go back</button>
		    <br>
			</form>
			<%
			//Make an HTML table to show the results in:
			out.print("<table>");
			
			//make a row
			out.print("<tr>");
			//make a column 1
			out.print("<td>Player Number</td>");
			//make a column
			out.print("<td>Name</td>");
			//make a column
			out.print("<td>Position</td>");
			//make a column
			out.print("<td>School</td>");
			out.print("<td>Playtime</td>");
			//make a column
			out.print("<td>Tackles</td>");
			//make a column
			out.print("<td>Touchdowns</td>");
			//make a column
			out.print("<td>Field Goals</td>");
			//make a column
			out.print("<td>Status</td>");
			
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
				out.print("<td>" + result.getString("SCHOOL") + "</td>");
				
				//make a column
				out.print("<td>" + result.getString("PLAYTIME") + "</td>");
				//make a column
				out.print("<td>" + result.getString("TACKLES") + "</td>");
				//make a column
				out.print("<td>" + result.getString("TOUCHDOWNS") + "</td>");
				//make a column
				out.print("<td>" + result.getString("FIELD_GOALS") + "</td>");
				//make a column
				out.print("<td>" + result.getString("DEPTH_CHART") + "</td>");
				
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