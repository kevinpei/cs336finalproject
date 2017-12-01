<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Team Averages</title>
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
			String str = null;
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			str = "SELECT f.SCHOOL, AVG(f.CRIMES), s.ENDOWMENT, s.SPORTSEXPENSES, t.FCOACHPAY FROM cs336project.PlayerData f, cs336project.SchoolData s, cs336project.FootballTeamData t WHERE f.SCHOOL = s.SCHOOL and f.SCHOOl = t.SCHOOL GROUP BY f.SCHOOL ORDER BY AVG(f.CRIMES) desc";
			out.print("As you can see, crime rate is positively correlated with school endowment. Rutgers however seems to have an " +
			"unusually high crime rate. If you are a Rutgers administrator, you should try to rectify this as soon as possible. See the graph at the bottom for an illustration.<br><br>");
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table id=\"data\">");
			
			//make a row
			out.print("<tr>");
			//make a column 1
			out.print("<th>School</th>");
			//make a column 2
			out.print("<th>Average Number of Crimes Committed per Player</th>");
			out.print("<th>School Endowment</th>");
			out.print("<th>School Sports Expenses</th>");
			out.print("<th>Football Coach Pay</th>");
			out.print("</tr>");
			

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>" + result.getString("f.SCHOOL") + "</td>");
				out.print("<td>" + result.getString("AVG(f.CRIMES)") + "</td>");
				out.print("<td>" + result.getString("s.ENDOWMENT") + "</td>");
				out.print("<td>" + result.getString("s.SPORTSEXPENSES") + "</td>");
				out.print("<td>" + result.getString("t.FCOACHPAY") + "</td>");
				out.print("</tr>");
			} //end while loop
			out.print("</table>");
			//close the connection.
			out.print("<img src=\"football_crime.png\" />");
			con.close();
			
			
			
	} catch (Exception e) {
		out.print(e);
	}		
			
	%>

</body>
</html>