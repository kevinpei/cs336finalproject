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
		String entity = request.getParameter("finances");
		String str = null;

		
		//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
		if(entity.equals("Select")){
			con.close();
		} else if(entity.equals("Endowment")){
			out.print("<br><br>As you can see, funding is positively correlated with Win/Loss ratio. This means that " + 
					"the better funded your school is, the better your football team will perform. There is a graph at the bottom of this page illustrating that.<br><br>");
			str = "SELECT a.SCHOOL, f.ENDOWMENT, a.WINS, a.LOSSES, a.WINS/a.LOSSES AS ratio FROM cs336project.FootballTeamData a, cs336project.SchoolData f WHERE a.SCHOOL = f.SCHOOL GROUP BY a.SCHOOL ORDER BY ratio desc limit 14";
		} else if(entity.equals("Coachpay")){
			out.print("<br><br>As you can see, football coach pay is positively correlated with Win/Loss ratio. This means that if " + 
					"your coach is better paid, your football team will perform better. There is a graph at the bottom of this page illustrating that.<br><br>");
			str = "SELECT a.SCHOOL, a.COACH, a.FCOACHPAY, a.WINS, a.LOSSES, a.WINS/a.LOSSES AS ratio FROM cs336project.FootballTeamData a GROUP BY a.SCHOOL ORDER BY ratio desc limit 14";
		} else { //Expenses  		if(entity.equals("Expenses")){
			str = "SELECT a.SCHOOL, f.SPORTSEXPENSES, a.WINS, a.LOSSES, a.WINS/a.LOSSES AS ratio FROM cs336project.FootballTeamData a, cs336project.SchoolData f WHERE a.SCHOOL = f.SCHOOL GROUP BY a.SCHOOL ORDER BY ratio desc limit 14";
			out.print("<br><br>As you can see, sports expenses are positively correlated with Win/Loss ratio. This means that if " + 
					"you increase your funding of sports, your football team will perform better. There is a graph at the bottom of this page illustrating that.<br><br>");
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
			out.print("<th>Coach</th>");
		}
		
		//make a column 2
		if(entity.equals("Endowment")){
			out.print("<th>School Endowment</th>");
		} else if (entity.equals("Coachpay")){
			out.print("<th>Coach's Salary</th>");
		} else if (entity.equals("Expenses")){
			out.print("<th>Sports Expenses</th>");
		} //end if else
			
		//make a column 3
		out.print("<th>Wins</th>");
		//make a column 4
		out.print("<th>Losses</th>");
		out.print("<th>Win/Loss Ratio</th>");
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
				out.print("<td>" + result.getString("FCOACHPAY") + "</td>");
			} else if (entity.equals("Expenses")){
				out.print("<td>" + result.getString("SPORTSEXPENSES") + "</td>");
			} //end if else
				
			//make a column 3
			out.print("<td>" + result.getString("WINS") + "</td>");
			//make a column 4
			out.print("<td>" + result.getString("LOSSES") + "</td>");
			out.print("<td>" + result.getString("ratio") + "</td>");
			
			out.print("</tr>");
		} //end while loop
		
		
		out.print("</table>");
		if(entity.equals("Endowment")){
			out.print("<img src=\"football_funding_win_ratio.png\" />");
		} else if (entity.equals("Coachpay")){
			out.print("<img src=\"football_coach_pay_ratio.png\" />");
		} else if (entity.equals("Expenses")){
			out.print("<img src=\"football_expenses_ratio.png\" />");
		} //end if else
		
		//close the connection.
		con.close();
		
	} catch (Exception e) {
		out.print(e);
	}		



%>

</body>
</html>