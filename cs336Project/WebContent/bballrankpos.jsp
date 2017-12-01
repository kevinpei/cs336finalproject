<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Basketball Stats per Position</title>
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
		String type = request.getParameter("OrderingStat");
		String str = "SELECT f.POS, AVG(f.POINTS) AS points, AVG(f.ASSISTS) AS assists, AVG(f.REBOUNDS) AS rebounds FROM cs336project.PlaysForB f GROUP BY f.POS ";
		if (type.equals("points")) {
			str += "ORDER BY points DESC";
		} else if (type.equals("assists")) {
			str += "ORDER BY assists DESC";
		} else {
			str += "ORDER BY rebounds DESC";
		}
			
			
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		//Make an HTML table to show the results in:
		out.print("<table id=\"data\">");
				
		//make a row
		out.print("<tr>");
		//make a column 1
		out.print("<th>Position</th>");
		out.print("<th>Average Points per Game</th>");
		out.print("<th>Average Assists per Game</th>");
		out.print("<th>Average Rebounds per Game</th>");
		out.print("</tr>");
		
		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column 1
			out.print("<td>" + result.getString("f.POS") + "</td>");
			out.print("<td>" + result.getString("points") + "</td>");
			out.print("<td>" + result.getString("assists") + "</td>");
			out.print("<td>" + result.getString("rebounds") + "</td>");
			
			out.print("</tr>");
		} //end while loop
				
		out.print("</table>");
		//close the connection.
		con.close();
		
	} catch (Exception e) {
		out.print(e);
	}		



%>


</body>
</html>