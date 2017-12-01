<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Schools and their Recruiting Areas</title>
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
		String entity = request.getParameter("University");
		String str = null;
		if (entity.equals("All")) {
			str = "SELECT b.SCHOOL, b.STATE, COUNT(a.NAME) FROM cs336project.PlaysForF a, cs336project.PlayerData b WHERE a.ID_NUM = b.ID_NUM AND a.SCHOOL = b.SCHOOL GROUP BY a.SCHOOL, b.STATE ORDER BY COUNT(a.NAME) desc";
		} else {
			str = "SELECT b.SCHOOL, b.STATE, COUNT(a.NAME) FROM cs336project.PlaysForF a, cs336project.PlayerData b WHERE a.ID_NUM = b.ID_NUM AND a.SCHOOL = \"" + entity + "\" GROUP BY b.STATE ORDER BY COUNT(a.NAME) desc";
		}

		if (entity.equals("Select")){
			//close
			con.close();
			
		} else {
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table id=\"data\">");
			
			//make a row
			out.print("<tr>");
			//make a column 1
			out.print("<th>School</th>");
			out.print("<th>State</th>");
			//make a column 2
			out.print("<th>Number of Players from State</th>");
			out.print("</tr>");
			
			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				out.print("<td>" + result.getString("b.SCHOOL") + "</td>");
				//make a column 1
				out.print("<td>" + result.getString("b.STATE") + "</td>");
				
				//make a column 2
				out.print("<td>" + result.getString("COUNT(a.NAME)") + "</td>");
				
				out.print("</tr>");
				
			} //end while loop
			
		} //end if else
			

	//close the connection.
		con.close();
		
	} catch (Exception e) {
		out.print(e);
	}		




%>

</body>
</html>