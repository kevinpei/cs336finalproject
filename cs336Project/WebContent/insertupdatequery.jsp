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
			//need a sport entity
			
			//initialize query string
			String str = null;
			String str1 = null;
			
			
			if (val.equals("Insert")){
				if(entity.equals("Select") || ent1 == "" || ent3 == ""){
					//dont update anything, invalid input
					out.print("<table>");
					out.print("<tr>");
					out.print("<td>Invalid Insertion</td>");
				
				} else {
				
					//if insert
					// INSERT INTO table_name
					// VALUES (value1, value2, value3, ...); 
				
				
					//insert for PlayerData
					str = "INSERT INTO cs336project.PlaysForB (NO, NAME, POS, SCHOOL, ID_NUM, PLAYTIME, REBOUNDS, ASSISTS, BLOCKS, STEALS, FOULS, TURNOVERS, POINTS) VALUES (\"" + ent1 + "\", \"" + ent6 + "\", \"" + ent7 + "\", \"" + ent8 + "\", \"" + ent4 + "\", \"" + ent5 + "\", \"" + entity + "\", \"" + ent10 + "\", \"" + ent11 + "\", \"" + ent12 + "\", \"" + ent13 + "\", \"" + ent9 + "\")";
						
					//insert for PlaysForB
					str1 = "INSERT INTO cs336.project.PlayerData (NAME, HT, WT, CLASS, HOMETOWN, STATE, SCHOOL, GPA, CRIMES, INJURIES, ID_NUM, MAJOR) VALUES (\"" + ent3 + "\", \"" + ent1 + "\", \"" + ent2 + "\", \"" + entity + "\", \"" + ent13 + "\", 0, 0, 0, 0, 0, 0, 0, 0)";
						
					//Run the query against the database.
					int result = stmt.executeUpdate(str);
						//hey
				} //end if else valid
			} else {
				if(entity.equals("Select") || ent1.equals(" ")){
					//dont update anything, invalid input
					out.print("<table>");
					out.print("<tr>");
					out.print("<td>Invalid Update</td>");
				
				} else {
			
				//if update
				// UPDATE table_name 
				// SET column1 = value1, column2 = value2, ...
				// WHERE condition; 
			
				
				
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