<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Determinants of Football Win/Loss Ratios</title>
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
		String type = request.getParameter("Stat");
		String str = "SELECT f.SCHOOL, ";
		if (type.equals("Tackles")) {
			out.print("<br><br>As you can see, average tackles per game are positively correlated with win/loss ratio." +
					"This means that it's better to have more tackles per game. This is because the more tackles you have, " +
					"the more points you have denied your opponents. This is illustrated in the goal below the table.<br><br>");
			str += "SUM(f.TACKLES) AS tackles, ";
		} else if (type.equals("Touchdowns")) {
			out.print("<br><br>As you can see, average touchdowns per game are positively correlated with win/loss ratio." +
					"This means that it's better to have more touchdowns per game. This is because touchdowns are worth " +
					"six points, meaning they're an efficient way to get more points. This is illustrated in the goal below the table.<br><br>");
			str += "SUM(f.TOUCHDOWNS) AS touchdowns, ";
		} else {
			out.print("<br><br>As you can see, average field goals per game are negatively correlated with win/loss ratio." +
					"This means that it's better to have fewer field goals per game. This is because field goals are only " + 
					"worth three points compared to touchdowns, which are worth six. The time spent scoring field goals " + 
					"woudl be better spent scoring touchdowns instead. This is illustrated in the goal below the table.<br><br>");
			str += "SUM(f.FIELD_GOALS) AS field_goals, ";
		}
		str += "cs336project.FootballTeamData.WINS/cs336project.FootballTeamData.LOSSES AS ratio FROM cs336project.PlaysForF f " + 
		"INNER JOIN cs336project.FootballTeamData ON f.SCHOOL = cs336project.FootballTeamData.SCHOOL " + 
		"GROUP BY f.SCHOOL ORDER BY ratio DESC";
			
			
		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		//Make an HTML table to show the results in:
		out.print("<table id=\"data\">");
				
		//make a row
		out.print("<tr>");
		//make a column 1
		out.print("<th>School</th>");
		out.print("<th>Average " + type + " Per Game</th>");
		//make a column 2
		out.print("<th>School Win/Loss Ratio</th>");
		out.print("</tr>");
		
		//parse out the results
		while (result.next()) {
			//make a row
			out.print("<tr>");
			//make a column 1
			out.print("<td>" + result.getString("f.SCHOOL") + "</td>");
			if (type.equals("Tackles")) {
				out.print("<td>" + result.getString("tackles") + "</td>");
			} else if (type.equals("Touchdowns")) {
				out.print("<td>" + result.getString("touchdowns") + "</td>");
			} else {
				out.print("<td>" + result.getString("field_goals") + "</td>");
			}
			//make a column 4
			out.print("<td>" + result.getString("ratio") + "</td>");
			
			out.print("</tr>");
		} //end while loop
				
		out.print("</table>");
		//close the connection.
		if (type.equals("Tackles")) {
				out.print("<img src=\"tackle_win_loss_ratio.png\" />");
			} else if (type.equals("Touchdowns")) {
								out.print("<img src=\"touchdown_win_loss_ratio.png\" />");
			} else {
								out.print("<img src=\"field_goal_win_loss_ratio.png\" />");
			}
		con.close();
		
	} catch (Exception e) {
		out.print(e);
	}		












%>

</body>
</html>