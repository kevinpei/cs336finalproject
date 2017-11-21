<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Best Players</title>
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
		String entity = request.getParameter("best");
		String ent2 = request.getParameter("bestp");
		String str = null;

		if(ent2.equals("C") || ent2.equals("F") || ent2.equals("G")){
			str = "SELECT a.* FROM cs336project.PlaysForB a WHERE a.SCHOOL = \"" + entity + "\" AND a.POS = \"" + ent2 + "\" GROUP BY a.NAME ORDER BY SUM(a.POINTS + a.ASSISTS + a.BLOCKS + a.REBOUNDS + a.STEALS - a.TURNOVERS) desc";
		} else {
			str = "SELECT a.* FROM cs336project.PlaysForB a WHERE a.SCHOOL = \"" + entity + "\" GROUP BY a.NAME ORDER BY SUM(a.POINTS + a.ASSISTS + a.BLOCKS + a.REBOUNDS + a.STEALS - a.TURNOVERS) desc";
		} //end if else
			
			
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		%>
		<form method="post" action="basketball_index.jsp">
	    <button type="submit" name="command" value="Back">Go back</button>
	    <br>
		</form>
		<%
		//Make an HTML table to show the results in:
		out.print("<table>");
				
		//make a row
		out.print("<tr>");
		//make a column 1
		out.print("<td>School</td>");
		//make a column 2
		out.print("<td>Name</td>");
		//make a column 3
		out.print("<td>Position</td>");
		//make a column 4
		out.print("<td>Playtime</td>");
		out.print("<td>Points</td>");
		//make a column 5
		out.print("<td>Assists</td>");
		//make a column 6
		out.print("<td>Blocks</td>");
		//make a column 7
		out.print("<td>Rebounds</td>");
		//make a column 8
		out.print("<td>Steals</td>");
		//make a column 9
		out.print("<td>Turnovers</td>");
		out.print("</tr>");
		
		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column 1
			out.print("<td>" + result.getString("SCHOOL") + "</td>");
			//make column 2		
			out.print("<td>" + result.getString("NAME") + "</td>");
			//make column 3		
			out.print("<td>" + result.getString("POS") + "</td>");
			//make column 3		
			out.print("<td>" + result.getString("PLAYTIME") + "</td>");
			//make a column 4
			out.print("<td>" + result.getString("POINTS") + "</td>");
			//make column 5	
			out.print("<td>" + result.getString("ASSISTS") + "</td>");
			//make column 6	
			out.print("<td>" + result.getString("BLOCKS") + "</td>");
			//make a column 7
			out.print("<td>" + result.getString("REBOUNDS") + "</td>");
			//make column 8	
			out.print("<td>" + result.getString("STEALS") + "</td>");
			//make column 9	
			out.print("<td>" + result.getString("TURNOVERS") + "</td>");
			
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