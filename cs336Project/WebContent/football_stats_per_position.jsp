<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Football Stats per Position</title>
</head>
<body>
<div class="banner">
	<img src="FUBAR.jpg" />
</div>
<div class="navigation" id="navigationbar">
  <a href="main_index.jsp">Home</a>
  <a href="football_index.jsp">Football for Administrators</a>
  <a href="basketball_index.jsp">Basketball for Administrators</a>
  <a href="administrator_index.jsp">Football for Fans</a>
  <a href="fan_index.jsp">Basketball for Fans</a>
</div>
<%

	try {
	
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Get the selected radio button from the index.jsp
		String type = request.getParameter("OrderingStat");
		String str = "SELECT f.POS, AVG(f.TACKLES) AS tackles, AVG(f.TOUCHDOWNS) AS touchdowns, AVG(f.FIELD_GOALS) AS fgoals FROM cs336project.PlaysForF f GROUP BY f.POS ";
		if (type.equals("Tackles")) {
			str += "ORDER BY tackles DESC";
		} else if (type.equals("Touchdowns")) {
			str += "ORDER BY touchdowns DESC";
		} else {
			str += "ORDER BY fgoals DESC";
		}
			
			
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		//Make an HTML table to show the results in:
		out.print("<table id=\"data\">");
				
		//make a row
		out.print("<tr>");
		//make a column 1
		out.print("<th>Position</th>");
		out.print("<th>Average Tackles per Game</th>");
		out.print("<th>Average Touchdowns per Game</th>");
		out.print("<th>Average Field Goals per Game</th>");
		out.print("</tr>");
		
		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column 1
			out.print("<td>" + result.getString("f.POS") + "</td>");
			out.print("<td>" + result.getString("tackles") + "</td>");
			out.print("<td>" + result.getString("touchdowns") + "</td>");
			out.print("<td>" + result.getString("fgoals") + "</td>");
			
			out.print("</tr>");
		} //end while loop
				
		out.print("</table>");
		//close the connection.
		if (type.equals("Tackles")) {
				out.print("<br><br>As you can see, average tackles per game are positively correlated with win/loss ratio." +
		"This means that it's better to have more tackles per game. This is because ensuring the other team can't score " + 
						"is an important path to victory.<br><br>");
				out.print("<img src=\"tackle_win_loss_ratio.png\" />");
			} else if (type.equals("Touchdowns")) {
				out.print("<br><br>As you can see, average touchdowns per game are positively correlated with win/loss ratio." +
						"This means that it's better to have more touchdowns per game. This is because touchdowns are worth " +
						"six points, meaning they're an efficient way to get more points.<br><br>");
								out.print("<img src=\"touchdown_win_loss_ratio.png\" />");
			} else {
				out.print("<br><br>As you can see, average field goals per game are negatively correlated with win/loss ratio." +
						"This means that it's better to have fewer field goals per game. This is because field goals are only " + 
						"worth three points compared to touchdowns, which are worth six. The time spent scoring field goals " + 
						"woudl be better spent scoring touchdowns instead.<br><br>");
								out.print("<img src=\"field_goal_win_loss_ratio.png\" />");
			}
		con.close();
		
	} catch (Exception e) {
		out.print(e);
	}		












%>

</body>
</html>