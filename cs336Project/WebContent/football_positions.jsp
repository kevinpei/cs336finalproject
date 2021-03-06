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
  <a href="football_administrator_index.jsp">Football for Administrators and Fans</a>
  <a href="basketball_administrator_index.jsp">Basketball for Administrators and Fans</a>
  <a class="active" href="administrator_index.jsp">For Administrators</a>
  <a href="fan_index.jsp">For Fans</a>
</div>
<%

	try {
	
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the selected radio button from the index.jsp
		String str = "SELECT f.SCHOOL, COUNT(DISTINCT f.POS) AS positions, " + 
		"cs336project.FootballTeamData.WINS/cs336project.FootballTeamData.LOSSES AS ratio FROM cs336project.PlaysForF f " + 
		"INNER JOIN cs336project.FootballTeamData ON f.SCHOOL = cs336project.FootballTeamData.SCHOOL " + 
		"GROUP BY f.SCHOOL ORDER BY ratio DESC";
			
			
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		//Make an HTML table to show the results in:
		out.print("<table id=\"data\">");
				
		//make a row
		out.print("<tr>");
		//make a column 1
		out.print("<th>School</th>");
		out.print("<th>Number of Positions</th>");
		//make a column 2
		out.print("<th>School Win/Loss Ratio</th>");
		out.print("</tr>");
		
		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column 1
			out.print("<td>" + result.getString("f.SCHOOL") + "</td>");
			//make column 2		
			out.print("<td>" + result.getString("positions") + "</td>");

			out.print("<td>" + result.getString("ratio") + "</td>");
			
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