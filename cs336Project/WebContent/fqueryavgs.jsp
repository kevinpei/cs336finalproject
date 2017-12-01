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
  <a href="football_fan_index.jsp">Football for Fans</a>
  <a href="basketball_fan_index.jsp">Basketball for Fans</a>
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
				str = "SELECT f.SCHOOL, AVG(f.GPA), AVG(f.INJURIES) FROM cs336project.PlayerData f GROUP BY f.SCHOOL ORDER BY AVG(f.GPA) desc";
				out.print("As you can see, GPA and injury record is mostly constant per school. However, in the case of Penn State, the GPA is unusually " +
				"low. If you are a Penn State administrator, you should try to rectify this as soon as possible.<br><br>");
			} else {
				str = "SELECT s1.POS, AVG(f.GPA), AVG(f.INJURIES) FROM cs336project.PlaysForF s1, cs336project.PlayerData f WHERE s1.ID_NUM = f.ID_NUM AND s1.SCHOOL = f.SCHOOL GROUP BY s1.POS ORDER BY AVG(f.GPA) desc";
				out.print("As you can see, GPA and injury record are closely related. Further, position seems to determine injury record, " + 
				"which in turn determines GPA. Be careful of who you assign to what positions.<br><br>");
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
			out.print("<th>Average Number of Injuries</th>");
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
				out.print("<td>" + result.getString("AVG(f.GPA)") + "</td>");
				out.print("<td>" + result.getString("AVG(f.INJURIES)") + "</td>");
				
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