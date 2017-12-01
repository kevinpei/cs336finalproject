<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deletion</title>
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
<div>
<img class="football_background" src="football_player.jpg" />
</div>
<div>
<img class="basketball_background" src="basketball_player.jpg" />
</div>
<div class="body">
<br>
<%
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("University");
			String ent1 = request.getParameter("id");
		
			String str = null;
			String str1 = null;
			String str2 = null;
			//DELETE FROM Customers
			//WHERE CustomerName='Alfreds Futterkiste';
			String error = "";
			
			try {
				int id = Integer.parseInt(ent1);
				if (id < 0) {
					error += "Your school ID can't be negative.";
				}
				if (ent1.length() > 9) {
					error += "Your school ID must be 9 digits at most.";
				}
			} catch (NumberFormatException e) {
				error += "You must enter an integer as your school ID number. ";
			}
			if (!error.equals("")) {
				out.print("Invalid delete. " + error);
			} else {
				//Check to make sure that the player actually exists.
				int id = Integer.parseInt(ent1);
				ResultSet keyCheck = stmt.executeQuery("SELECT * FROM cs336project.PlayerData WHERE ID_NUM = " + id + " AND SCHOOL = \"" + entity + "\"");
				boolean empty = true;
				while (keyCheck.next()) {
					empty = false;
				}
				if (empty) {
					error += "There is no player with that School and ID. ";
				}
				if (!error.equals("")) {
					out.print("Invalid delete. " + error);
				} else {
					str = "DELETE FROM cs336project.PlaysForB WHERE ID_NUM = " + id + " AND SCHOOL = \"" + entity + "\"";
					str1 = "DELETE FROM cs336project.PlaysForF WHERE ID_NUM = " + id + " AND SCHOOL = \"" + entity + "\"";
					str2 = "DELETE FROM cs336project.PlayerData WHERE ID_NUM = " + id + " AND SCHOOL = \"" + entity + "\""; //end if else
					out.print("Deletion Successful.");
						
					//Run the query against the database.
					int result = stmt.executeUpdate(str);
					int result1 = stmt.executeUpdate(str1);
					int result2 = stmt.executeUpdate(str2);
				}
			} //end if else
			
			
			//close the connection.
			con.close();
			
		} catch (Exception e) {
			out.print(e);
		}
%>
</div>
</body>
</html>