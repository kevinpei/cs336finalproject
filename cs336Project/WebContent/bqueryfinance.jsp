<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Finances vs. Performance</title>
</head>
<body>
<div class="navigation" id="navigationbar">
  <a href="main_index.jsp">Home</a>
  <a href="football_index.jsp">Football</a>
  <a href="basketball_index.jsp">Basketball</a>
</div>
<%

	try {
	
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the selected radio button from the index.jsp
		String entity = request.getParameter("finances");
		String str = null;

		
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		if(entity.equals("Select")){
			con.close();
		} else if(entity.equals("Endowment")){
			str = "SELECT a.SCHOOL, b.ENDOWMENT, a.WINS, a.LOSSES FROM cs336project.BasketballTeamData a, cs336project.SchoolData b WHERE a.SCHOOL = b.SCHOOL GROUP BY a.SCHOOL ORDER BY b.ENDOWMENT desc limit 14";
		} else if(entity.equals("Coachpay")){
			str = "SELECT a.SCHOOL, a.COACH, a.BCOACHPAY, a.WINS, a.LOSSES FROM cs336project.BasketballTeamData a GROUP BY a.SCHOOL ORDER BY a.BCOACHPAY desc limit 14";
		} else { //Expenses  		if(entity.equals("Expenses")){
			str = "SELECT a.SCHOOL, b.SPORTSEXPENSES, a.WINS, a.LOSSES FROM cs336project.BasketballTeamData a, cs336project.SchoolData b WHERE a.SCHOOL = b.SCHOOL GROUP BY a.SCHOOL ORDER BY b.SPORTSEXPENSES desc limit 14";
		}

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		
		//Make an HTML table to show the results in:
		out.print("<table id=\"data\">");
		
		//make a row
		out.print("<tr>");
		//make a column 1
		out.print("<th>SCHOOL</th>");
		
		if (entity.equals("Coachpay")){
			out.print("<th>COACH</th>");
		}
		
		//make a column 2
		if(entity.equals("Endowment")){
			out.print("<th>Endowment</th>");
		} else if (entity.equals("Coachpay")){
			out.print("<th>Coach's Salary</th>");
		} else if (entity.equals("Expenses")){
			out.print("<th>Sports Expenses</th>");
		} //end if else
			
		//make a column 3
		out.print("<th>Wins</th>");
		//make a column 4
		out.print("<th>Losses</th>");
		out.print("</tr>");
		

		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column 1
			out.print("<td>" + result.getString("SCHOOL") + "</td>");
			
			if(entity.equals("Coachpay")){
				out.print("<td>" + result.getString("COACH") + "</td>");
			}
			
			//column 2
			if(entity.equals("Endowment")){
				out.print("<td>" + result.getString("ENDOWMENT") + "</td>");
			} else if (entity.equals("Coachpay")){
				out.print("<td>" + result.getString("BCOACHPAY") + "</td>");
			} else if (entity.equals("Expenses")){
				out.print("<td>" + result.getString("SPORTSEXPENSES") + "</td>");
			} //end if else
				
			//make a column 3
			out.print("<td>" + result.getString("WINS") + "</td>");
			//make a column 4
			out.print("<td>" + result.getString("LOSSES") + "</td>");
			
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