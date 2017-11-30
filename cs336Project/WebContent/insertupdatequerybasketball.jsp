<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert or Update Player Information</title>
</head>
<body>
<div class="banner">
	<img src="FUBAR.jpg" />
</div>
<div class="navigation" id="navigationbar">
  <a href="main_index.jsp">Home</a>
  <a href="football_index.jsp">Football</a>
  <a href="basketball_index.jsp">Basketball</a>
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
			
			String val = request.getParameter("Insert");
				
			//Get data from fields in insertupdateindex.jsp
			String entity = request.getParameter("University");
			String ent1 = request.getParameter("name");
			String ent2 = request.getParameter("Position");
			String ent3 = request.getParameter("number");
			String ent4 = request.getParameter("town");
			String ent5 = request.getParameter("state");
			String ent6 = request.getParameter("height");
			String ent7 = request.getParameter("weight");
			String ent8 = request.getParameter("class");
			String ent9 = request.getParameter("major");
			String ent10 = request.getParameter("gpa");
			String ent11 = request.getParameter("crimes");
			String ent12 = request.getParameter("injuries");
			String ent13 = request.getParameter("idnum");
			//need a sport entity
			
			//initialize query string
			String str = null;
			String str1 = null;
			
			String error = "";
			boolean jerseyCheck = true;
			boolean IDCheck = true;
			//If the user enters numbers for these fields, check to make sure they're valid
			if (entity.equals("Select")) {
				error += "You must select a university. ";
			}
			if (ent3.equals("")) {
				error += "You must enter a jersey number. ";
				jerseyCheck = false;
			}
			try {
				int number = Integer.parseInt(ent3);
				if (number < 0) {
					error += "Your jersey number can't be negative.";
				}
			} catch (NumberFormatException e) {
				error += "You must enter an integer as your jersey number. ";
				jerseyCheck = false;
			}
			if (!ent6.equals("")) {
				try {
					int number = Integer.parseInt(ent6);
					if (number < 0) {
						error += "Your height can't be negative.";
					}
				} catch (NumberFormatException e) {
					error += "You must enter an integer as your height. ";
				}
			}
			if (!ent7.equals("")) {
				try {
					int number = Integer.parseInt(ent7);
					if (number < 0) {
						error += "Your weight can't be negative.";
					}
				} catch (NumberFormatException e) {
					error += "You must enter an integer as your weight. ";
				}
			}
			if (!ent10.equals("")) {
				try {
					double gpa = Double.parseDouble(ent10);
					if (gpa < 1) {
						error += "Your GPA can't be less than 1.00.";
					}
					if (gpa > 4) {
						error += "Your GPA can't be more than 4.00.";
					}
				} catch (NumberFormatException e) {
					error += "You must enter a double as your GPA. ";
				}
			}
			if (!ent11.equals("")) {
				try {
					int number = Integer.parseInt(ent11);
					if (number < 0) {
						error += "Your number of crimes committed can't be negative.";
					}
				} catch (NumberFormatException e) {
					error += "You must enter an integer as your number of crimes committed. ";
				}
			}
			if (!ent12.equals("")) {
				try {
					int number = Integer.parseInt(ent12);
					if (number < 0) {
						error += "Your number of injuries can't be negative.";
					}
				} catch (NumberFormatException e) {
					error += "You must enter an integer as your number of injuries. ";
				}
			}
			if (ent13.equals("")) {
				error += "You must enter a school ID number. ";
				IDCheck = false;
			}
			else {
				try {
					int id = Integer.parseInt(ent13);
					if (id < 0) {
						error += "Your school ID can't be negative.";
					}
					if (ent13.length() > 9) {
						error += "Your school ID must be 9 digits at most.";
					}
				} catch (NumberFormatException e) {
					error += "You must enter an integer as your school ID number. ";
					IDCheck = false;
				}
			}
			if (jerseyCheck) {
				//Make sure there isn't already a player with the same player number and school
				ResultSet keyCheck = stmt.executeQuery("SELECT * FROM cs336project.PlaysForB WHERE NO = " + ent3 + " AND SCHOOL = \"" + entity + "\"");
				boolean empty = true;
				while (keyCheck.next()) {
					empty = false;
				}
				if (!empty) {
					error += "There already exists a player with that jersey number and team. ";
				}
				
			}
			
			//For insert, you need a name and player number
			if (val != null){
				
				if(ent1.equals("")) {
					error += "You must enter a name. ";
				}
				if (ent2.equals("Select")) {
					error += "You must select a position. ";
				}
				if (ent3.equals("")) {
					error += "You must enter a player number. ";
				}
				if (IDCheck) {
					//Make sure that there isn't already a student with the same ID and school
					ResultSet keyCheck = stmt.executeQuery("SELECT * FROM cs336project.PlayerData WHERE ID_NUM = " + ent13 + " AND SCHOOL = \"" + entity + "\"");
					boolean empty = true;
					while (keyCheck.next()) {
						empty = false;
					}
					if (!empty) {
						error += "There already exists a player with that ID and school. ";
					}
				}
				if (!error.equals("")) {
					out.print("Invalid Insertion. " + error);
				} else {
					//Any field that isn't filled out defaults to 0 or --
					if (ent4.equals(""))
						ent4 = "--";
					if (ent5.equals("Select"))
						ent5 = "--";
					if (ent6.equals(""))
						ent6 = "0";
					if (ent7.equals(""))
						ent7 = "0";
					if (ent8.equals("Select"))
						ent8 = "--";
					if (ent9.equals(""))
						ent9 = "--";
					if (ent10.equals(""))
						ent10 = "1.00";
					if (ent11.equals(""))
						ent11 = "0";
					if (ent12.equals(""))
						ent12 = "0";
					str = "INSERT INTO cs336project.PlaysForB (NO, NAME, POS, SCHOOL, ID_NUM, PLAYTIME, REBOUNDS, ASSISTS, BLOCKS, STEALS, FOULS, TURNOVERS, POINTS) VALUES (" + ent3 + ", \"" + ent1 + "\", \"" + ent2 + "\", \"" + entity + "\", " + ent13 + ", 0, 0, 0, 0, 0, 0, 0, 0)";
					//insert for PlayerData
					str1 = "INSERT INTO cs336project.PlayerData (NAME, HT, WT, CLASS, HOMETOWN, STATE, SCHOOL, GPA, CRIMES, INJURIES, ID_NUM, MAJOR) VALUES (\"" + ent1 + "\", " + ent6 + ", " + ent7 + ", \"" + ent8 + "\", \"" + ent4 + "\", \"" + ent5 + "\", \"" + entity + "\", " + ent10 + ", " + ent11 + ", " + ent12 + ", " + ent13 + ", \"" + ent9 + "\")";

					out.print("Insert Successful.");
					
					//Run the query against the database.
					int result = stmt.executeUpdate(str);
					int result1 = stmt.executeUpdate(str1);
					//end if else valid
				}
			//if it is an update query
			} else { //update query
					if (!error.equals("")) {
						out.print("Invalid Update. " + error);
					} else {
						//if update
						// UPDATE table_name 
						// SET column1 = value1, column2 = value2, ...
						// WHERE condition; 
						str = "UPDATE cs336project.PlaysForB SET ";
						str1 = "UPDATE cs336project.PlayerData SET ";
						if (!ent1.equals("")){ //player name change 
							str = str + "NAME = \"" + ent1 + "\", ";
							str1 = str1 + "NAME = \"" + ent1 + "\", ";
						}
						if (!ent2.equals("Select"))
							str = str + "POS = \"" + ent2 + "\", ";
						if (!ent3.equals(""))//player number change
							str = str + "NO = " + ent3 + ", ";
						if(!ent4.equals("")) 
							str1 = str1 + "HOMETOWN = \"" + ent4 + "\", ";
						if (!ent5.equals("Select"))
							str1 = str1 + "STATE = \"" + ent5 + "\", ";
						if(!ent6.equals(""))
							str1 = str1 + "HEIGHT = " + ent6 + ", ";
						if(!ent7.equals(""))
							str1 = str1 + "WEIGHT = " + ent7 + ", ";
						if(!ent8.equals("Select"))
							str1 = str1 + "CLASS = \"" + ent8 + "\", ";
						if(!ent9.equals(""))
							str1 = str1 + "MAJOR = \"" + ent9 + "\", ";
						if(!ent10.equals(""))
							str1 = str1 + "GPA = " + ent10 + ", ";
						if(!ent11.equals(""))
							str1 = str1 + "CRIMES = " + ent11 + ", ";
						if(!ent12.equals(""))
							str1 = str1 + "INJURIES = " + ent12 + " ";
						if (str.substring(str.length() - 2).equals(", "))
							str = str.substring(0, str.length() - 2);
						if (str1.substring(str1.length() - 2).equals(", "))
							str1 = str1.substring(0, str1.length() - 2);
						str = str + " WHERE SCHOOL = \"" + entity + "\" AND ID_NUM = " + ent13;
						str1 = str1 + " WHERE SCHOOL = \"" + entity + "\" AND ID_NUM = " + ent13;
						stmt.executeUpdate(str);
						stmt.executeUpdate(str1);
						out.print("Update Successful.");
					}
					
					
					//Run the query against the database.
					 //str is PlaysForB or PlaysForF
					//int result1 = stmt.executeUpdate(str1); //str1 is PlayerData
			
				
				} //end if else
					//end if else insert or update
			
			//close the connection.
			con.close();
			
		} catch (Exception e) {
			out.print(e);
		}
%>

</div>
</body>
</html>