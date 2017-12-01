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
</div>

<%

	try {
	
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the selected radio button from the index.jsp
		String school = request.getParameter("BestUniversity");
		String position = request.getParameter("BestPosition");
		String stat = request.getParameter("BestStat");
		String str = "SELECT f.* FROM cs336project.PlaysForF f WHERE ";

		if (!school.equals("All")) {
			str = str + "f.SCHOOL = \"" + school + "\" AND ";
		}
		if (!position.equals("All")) {
			str = str + "f.POS = \"" + position + "\" ";
		}
		//Remove any AND or WHERE at the end
		if (str.substring(str.length() - 4).equals("AND "))
			str = str.substring(0, str.length() - 4);
		if (str.substring(str.length() - 6).equals("WHERE "))
			str = str.substring(0, str.length() - 6);
		
		if (stat.equals("TACKLES")) {
			str = str + "GROUP BY f.NAME ORDER BY f.TACKLES DESC";
		} else if (stat.equals("TOUCHDOWNS")) {
			str = str + "GROUP BY f.NAME ORDER BY f.TOUCHDOWNS DESC";
		} else if (stat.equals("FIELD_GOALS")) {
			str = str + "GROUP BY f.NAME ORDER BY f.FIELD_GOALS DESC";
		} else {
			str = str + "GROUP BY f.NAME ORDER BY SUM(f.TOUCHDOWNS + f.TACKLES + f.FIELD_GOALS) DESC";
		}
			
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
		out.print("<th>Playtime (Percent of the Time)</th>");
		//make a column
		out.print("<th>Tackles (Per Season)</th>");
		//make a column
		out.print("<th>Touchdowns (Per Season)</th>");
		//make a column
		out.print("<th>Field Goals (Per Season)</th>");
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