<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Best Players</title>
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
		String stat = request.getParameter("BestStat");
		String str = null;
		if (stat.equals("Height")) {
			str = "SELECT f.NAME, p.HT, f.TACKLES, f.TOUCHDOWNS, f.FIELD_GOALS, f.TACKLES + f.TOUCHDOWNS + f.FIELD_GOALS AS total FROM cs336project.PlaysForF f, cs336project.PlayerData p WHERE p.SCHOOL = f.SCHOOL and p.ID_NUM = f.ID_NUM ";
			out.print("Height is a reasonably good determinant of performance for football players. The distribution appears to be " +
			"roughly Gaussian, with exceptional players having heights near the middle, while poor players have both high and low heights. See the graph below the table for a visualization.");
		} else {
			str = "SELECT f.NAME, p.WT, f.TACKLES, f.TOUCHDOWNS, f.FIELD_GOALS, f.TACKLES + f.TOUCHDOWNS + f.FIELD_GOALS AS total FROM cs336project.PlaysForF f, cs336project.PlayerData p WHERE p.SCHOOL = f.SCHOOL and p.ID_NUM = f.ID_NUM ";
			out.print("Weight is not a good determinant of performance for football players. The distribution appears to be " +
					"mostly random, with both exceptional and poor players having many different weights. See the graph below the table for a visualization.");
		}
		str = str + "GROUP BY f.NAME ORDER BY total DESC";
			
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);

		//Make an HTML table to show the results in:
		out.print("<table id=\"data\">");
				
		//make a row
		out.print("<tr>");
		//make a column
		out.print("<th>Name</th>");
		//make a column
		if (stat.equals("Height"))
		out.print("<th>Height</th>");
		//make a column
		else
		out.print("<th>Weight</th>");
		out.print("<th>Average Tackles (Per Game)</th>");
		//make a column
		out.print("<th>Average Touchdowns (Per Game)</th>");
		//make a column
		out.print("<th>Average Field Goals (Per Game)</th>");
		out.print("<th>Average Tackles, Touchdowns, and Field Goals (per Game)</th>");
		out.print("</tr>");
		

		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			out.print("<td>" + result.getString("f.NAME") + "</td>");
			//make a column
			if (stat.equals("Height"))
			out.print("<td>" + result.getString("p.HT") + "</td>");
			//make a column
			//make a column
			else
			out.print("<td>" + result.getString("p.WT") + "</td>");
			out.print("<td>" + result.getString("f.TACKLES") + "</td>");
			//make a column
			out.print("<td>" + result.getString("f.TOUCHDOWNS") + "</td>");
			//make a column
			out.print("<td>" + result.getString("f.FIELD_GOALS") + "</td>");
			out.print("<td>" + result.getString("total") + "</td>");
			
			out.print("</tr>");
			
		}
		
		out.print("</table>");
		//close the connection.
		if (stat.equals("Height")) {
			out.print("<img src=\"football_height_performance.png\" />");
		} else {
			out.print("<img src=\"football_weight_performance.png\" />");
		}
		con.close();
		
	} catch (Exception e) {
		out.print(e);
	}		












%>

</body>
</html>