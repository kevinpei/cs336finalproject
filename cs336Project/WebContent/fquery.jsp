<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Football Queries</title>
</head>
<body>
<div class="banner">
	<img src="FUBAR.jpg" />
</div>
<div class="navigation" id="navigationbar">
  <a href="main_index.jsp">Home</a>
  <a href="football_administrator_index.jsp">Football for Administrators</a>
  <a href="basketball_administrator_index.jsp">Basketball for Administrators</a>
</div>

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

			//Make an HTML table to show the results in:
			out.print("<table id=\"data\">");
			
			//make a row
			out.print("<tr>");
			//make a column 1
			out.print("<th>Player Number</th>");
			//make a column
			out.print("<th>Name</th>");
			//make a column
			out.print("<th>Position</th>");
			//make a column
			out.print("<th>School</th>");
			out.print("<th>Average Playtime (Minutes per Game)</th>");
			//make a column
			out.print("<th>Average Tackles (Per Game)</th>");
			//make a column
			out.print("<th>Average Touchdowns (Per Game)</th>");
			//make a column
			out.print("<th>Average Field Goals (Per Game)</th>");
			//make a column
			out.print("<th>Status</th>");
			
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