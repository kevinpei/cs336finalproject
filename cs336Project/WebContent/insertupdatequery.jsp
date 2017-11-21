<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert</title>
</head>
<body>


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
			String ent0 = request.getParameter("sport");
			//need a sport entity
			
			//initialize query string
			String str = null;
			String str1 = null;
			
			
			if (val.equals("Insert")){
				if(entity.equals("Select") || ent0.equals("Select") || ent1 == "" || ent3 == ""){
					//dont update anything, invalid input
					out.print("<table>");
					out.print("<tr>");
					out.print("<td>Invalid Insertion</td>");
				
				} else {
				
					//if insert
					// INSERT INTO table_name
					// VALUES (value1, value2, value3, ...); 
				
				
					//insert for PlaysFor
					// INSERT INTO PlaysForB (NO, NAME, POS, SCHOOL, ID_NUM, PLAYTIME, REBOUNDS, ASSISTS, BLOCKS, STEALS, FOULS, TURNOVERS, POINTS) 
					// VALUES (27, "Kevin Moran", "G", "Rutgers", 11111, 0,0,0,0,0,0,0,0)		
					if(ent0.equals("Basketball")){
						str = "INSERT INTO cs336project.PlaysForB (NO, NAME, POS, SCHOOL, ID_NUM, PLAYTIME, REBOUNDS, ASSISTS, BLOCKS, STEALS, FOULS, TURNOVERS, POINTS) VALUES (\"" + ent3 + "\", \"" + ent1 + "\", \"" + ent2 + "\", \"" + entity + "\", \"" + ent13 + "\", 0, 0, 0, 0, 0, 0, 0, 0)";
					} else {
						String backup = "backup";
						str = "INSERT INTO cs336project.PlaysForF (NO, NAME, POS, SCHOOL, PLAYTIME, TACKLES, TOUCHDOWNS, FIELD_GOALS, ID_NUM, DEPTH_CHART) VALUES (\"" + ent3 + "\", \"" + ent1 + "\", \"" + ent2 + "\", \"" + entity + "\", 0, 0, 0, 0,  \"" + ent13 + "\",  \"" + backup + "\" )";
					} //end if else
					
					//insert for PlayerData
					str1 = "INSERT INTO cs336project.PlayerData (NAME, HT, WT, CLASS, HOMETOWN, STATE, SCHOOL, GPA, CRIMES, INJURIES, ID_NUM, MAJOR) VALUES (\"" + ent1 + "\", \"" + ent6 + "\", \"" + ent7 + "\", \"" + ent8 + "\", \"" + ent4 + "\", \"" + ent5 + "\", \"" + entity + "\", \"" + ent10 + "\", \"" + ent11 + "\", \"" + ent12 + "\", \"" + ent13 + "\", \"" + ent9 + "\")";
						
					out.print("<table>");
					out.print("<tr>");
					out.print("<td>Insert Successful</td>");
					
					//Run the query against the database.
					int result = stmt.executeUpdate(str);
					int result1 = stmt.executeUpdate(str1);
						
				} //end if else valid
				
			//if it is an update query
			} else { //update query
				
				if(entity.equals("Select") || ent0.equals("Select") || ent13 == ""){ //entity = school, ent0 = sport, ID_num
					//dont update anything, invalid input
					out.print("<table>");
					out.print("<tr>");
					out.print("<td>Invalid Update</td>");
				
				} else {
			
					//if update
					// UPDATE table_name 
					// SET column1 = value1, column2 = value2, ...
					// WHERE condition; 
					
					
					if (ent0.equals("Basketball")){
						
						str = "UPDATE cs336project.PlaysForB SET ";
						if (ent1 != ""){ //player name change
							str = str + "NAME = \"" + ent1 + "\"";
						} else {}
						if(ent1 != "" && ent2 != "Select"){//player position change
							str = str + "AND POS = \"" + ent2 + "\"";
						} else if(ent2 == "Select"){ 
							str = str + "POS = \"" + ent2 + "\"";
						} else {}
						if (ent3 != "" && (ent1 != "" || ent2 != "Select")){//player number change
							str = str + "AND NO = \"" + ent3 + "\"";
						} else if(ent3 != ""){ 
							str = str + "NO = \"" + ent3 + "\"";
						} else{}
						str = str + " WHERE SCHOOL = \"" + entity + "\"AND ID_NUM = \"" + ent13 + "\"";
					
					} else { //if sport is football
						
						str = "UPDATE cs336project.PlaysForF SET ";
						if (ent1 != ""){ //player name change
							str = str + "NAME = \"" + ent1 + "\"";
						} else {}
						if(ent1 != "" && ent2 != "Select"){//player position change
							str = str + "AND POS = \"" + ent2 + "\"";
						} else if(ent2 == "Select"){ 
							str = str + "POS = \"" + ent2 + "\"";
						} else {}
						if (ent3 != "" && (ent1 != "" || ent2 != "Select")){//player number change
							str = str + "AND NO = \"" + ent3 + "\"";
						} else if(ent3 != ""){ 
							str = str + "NO = \"" + ent3 + "\"";
						} else{}
						str = str + " WHERE SCHOOL = \"" + entity + "\"AND ID_NUM = \"" + ent13 + "\"";
						
					} //end PlaysFor query creation
					
					/* 
					if(ent4 != "" && (ent1 != "" || ent2 != "Select" || ent3 != "")){//player hometown change
						str = str + "AND HOMETOWN = \"" + ent3 + "\"";
					} else if (ent4 !){
						str = str + "HOMETOWN = \"" + ent3 + "\"";
					} else {}
					if(ent5 != "Select" && (ent1 != "" || ent2 != "Select" || ent3 != "" || ent4 != "")){
						str = str + ""
					}
					*/
					
						
					
					
					out.print("<table>");
					out.print("<tr>");
					out.print("<td>Update Successful</td>");
					
					//Run the query against the database.
					int result = stmt.executeUpdate(str); //str is PlaysForB or PlaysForF
					//int result1 = stmt.executeUpdate(str1); //str1 is PlayerData
			
				
				} //end if else
					
			} //end if else insert or update
			
			//close the connection.
			con.close();
			
		} catch (Exception e) {
			out.print(e);
		}


%>


</body>
</html>