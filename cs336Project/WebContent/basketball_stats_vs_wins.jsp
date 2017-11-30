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
  <a href="football_index.jsp">Football</a>
  <a href="basketball_index.jsp">Basketball</a>
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
		String str = "SELECT b.SCHOOL, COUNT(CASE WHEN b.POS = \"C\" THEN 1 ELSE NULL END) AS center, " + 
		"COUNT(CASE WHEN b.POS = \"G\" THEN 1 ELSE NULL END) AS guard, " + 
		"COUNT(CASE WHEN b.POS = \"F\" THEN 1 ELSE NULL END) AS forward, " + 
		"cs336project.BasketballTeamData.WINS/cs336project.BasketballTeamData.LOSSES AS ratio FROM cs336project.PlaysForB b " + 
		"INNER JOIN cs336project.BasketballTeamData ON b.SCHOOL = cs336project.BasketballTeamData.SCHOOL " + 
		"GROUP BY b.SCHOOL ORDER BY ratio DESC";
			
			
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		//Make an HTML table to show the results in:
		out.print("<table id=\"data\">");
				
		//make a row
		out.print("<tr>");
		//make a column 1
		out.print("<th>School</th>");
		out.print("<th>Center Players</th>");
		//make a column 2
		out.print("<th>Guard Players</th>");
		out.print("<th>Forward Players</th>");
		out.print("<th>School Win/Loss Ratio</th>");
		out.print("</tr>");
		
		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column 1
			out.print("<td>" + result.getString("b.SCHOOL") + "</td>");
			//make column 2		
			out.print("<td>" + result.getString("center") + "</td>");
			//make column 3		
			out.print("<td>" + result.getString("guard") + "</td>");
			//make column 3		
			out.print("<td>" + result.getString("forward") + "</td>");
			//make a column 4
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