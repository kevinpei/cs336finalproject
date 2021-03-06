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
			String entity = request.getParameter("AvgStat");
			String str = null;
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			if(entity.equals("Select")){
				con.close();
			} else if(entity.equals("Averages by Team")){
				str = "SELECT b.SCHOOL, AVG(b.GPA), AVG(b.INJURIES), AVG(b.CRIMES) FROM cs336project.PlayerData b GROUP BY b.SCHOOL ORDER BY AVG(b.GPA) desc";
			} else {
				str = "SELECT s1.POS, AVG(b.GPA), AVG(b.INJURIES), AVG(b.CRIMES) FROM cs336project.PlaysForB s1, cs336project.PlayerData b WHERE s1.ID_NUM = b.ID_NUM AND s1.SCHOOL = b.SCHOOL GROUP BY s1.POS ORDER BY AVG(b.GPA) desc limit 3";
			}

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table id=\"data\">");
			
			//make a row
			out.print("<tr>");
			//make a column 1
			if(entity.equals("Averages by Team")){
				out.print("<th>School</th>");
			} else {
				out.print("<th>Position</th>");
			}
			//make a column 2
			out.print("<th>Average GPA</th>");
			//make a column 3
			out.print("<th>Average Number of Injuries</th>");
			//make a column 4
			out.print("<th>Average Number of Crimes Committed</th>");
			out.print("</tr>");
			

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				if(entity.equals("Averages by Team")){
					out.print("<td>" + result.getString("SCHOOL") + "</td>");
				} else {
					out.print("<td>" + result.getString("POS") + "</td>");
				}
				out.print("<td>" + result.getString("AVG(b.GPA)") + "</td>");
				//make a column
				out.print("<td>" + result.getString("AVG(b.INJURIES)") + "</td>");
				//make a column
				out.print("<td>" + result.getString("AVG(b.CRIMES)") + "</td>");
				
				out.print("</tr>");
			} //end while loop
			
			if(entity.equals("Averages by Team")){
				out.print("</table>");
				out.print("<img src=\"gpainjuriescrimesgraph.PNG\" />");
				
			} else {
				out.print("</table>");
				out.print("<img src=\"bgpapos.PNG\" />");
				out.print("<img src=\"binjpos.PNG\" />");
				out.print("<img src=\"bcrimepos.PNG\" />");
				
			} //end if else
			

			//close the connection.
			con.close();
			
			
			
	} catch (Exception e) {
		out.print(e);
	}		
			
	%>

</body>
</html>