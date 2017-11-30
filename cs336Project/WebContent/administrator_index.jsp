<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>For Administrators</title>
</head>
<body>
<div class="banner">
	<img src="FUBAR.jpg" />
</div>
<div class="navigation" id="navigationbar">
  <a href="main_index.jsp">Home</a>
  <a href="football_index.jsp">Football</a>
  <a href="basketball_index.jsp">Basketball</a>
  <a class="active" href="administrator_index.jsp">For Administrators</a>
  <a href="fan_index.jsp">For Fans</a>
</div>
<div>
<img class="football_background" src="football_player.jpg" />
</div>
<div>
<img class="basketball_background" src="basketball_player.jpg" />
</div>
<div class="body">
<br>
Hello administrator. This section of the website is for those who want to improve the performance of their teams for the least cost.
Choose one of the queries below to improve the performance for either your football or basketball team.
<br>
<br>
In football, there are tackles, touchdowns, and field goals. Which of these most determines the win/loss ratio of a team?<br><br>
Why not find out? The following options allow you to see how the average number of tackles, touchdowns, or field goals per game of each school
in the Big 10 compare to their win/loss ratio. The totals were obtained by adding together the average number of tackles, touchdowns, or field goals
per game for each player.
<br> 
	<form method="post" action="football_stats_vs_wins.jsp">
	<select name="Stat">
	  	<option value="Tackles">Average Tackles Per Game by a Team vs. Their Win Loss Ratio</option>
	  	<option value="Touchdowns">Average Touchdowns Per Game by a Team vs. Their Win Loss Ratio</option>
	  	<option value="Field Goals">Average Field Goals Per Game by a Team vs. Their Win Loss Ratio</option>
	</select>
	<input type="submit" value="Submit" class="submit">
	</form>
<br>
<br>
In football, there are 21 different positions: <br>DE, Defensive End<br>QB, Quarter Back<br>RB, Running Back<br>LB, Line Backer 
<br>DL, Defensive Line<br>TE, Tight End<br>DB, Defensive Back<br>OL, Offensive Line<br>P, Punter<br>LS, Long Snapper<br>PK, Place Kicker
<br>CB, Corner Back<br>DT, Defensive Tackle<br>HB, Half Back<br>FB, Full Back<br>OT, Offensive Tackle<br>S, Safety<br>G, Guard
<br>C, Center<br>WR, Wide Receiver<br>NT, Nose Tackle
<br>Each of these positions plays a different role and contributes a different number of tackles, touchdowns, and field goals.
Now let's see how much each position contributes.
<br> 
	<form method="post" action="football_stats_per_position.jsp">
	<table>
	<tr>
	<td></td><td>
<!--  Have a dropdown menu to select the university -->
	<select name="OrderingStat">
	  	<option value="Tackles">Order by Tackles</option>
	  	<option value="Touchdowns">Order by Touchdowns</option>
	  	<option value="Field Goals">Order by Field Goals</option>
	</select>
	</td>
	</tr>
	
	</table>
	<br>
	<input type="submit" value="Submit" class="submit">
	</form>
<br>




<% out.println("Finances and their relation to team record! ");%> 
<br> 
	<form method="post" action="bqueryfinance.jsp">
	<table>
	<tr>
	<td></td><td>
<!--  Have a dropdown menu to select the university -->
	<select name="finances">
	  	<option value="Endowment">University Endowment</option>
	  	<option value="Coachpay">Coach's Salary</option>
	  	<option value="Expenses">Athletic Department Expenses</option>
	</select>
	</td>
	</tr>
	
	</table>
	<br>
	<input type="submit" value="Submit" class="submit">
	</form>
<br>



<% out.println("Find the best players on each team by position! ");%> 
<br> 
	<form method="post" action="bquerybest.jsp">
	<table>
	<tr>
	<td>University</td><td>
<!--  Have a dropdown menu to select the university -->
	<select name="best">
		<option value="All">All Universities</option>
	  	<option value="Illinois">University of Illinois at Urbana-Champaign</option>
	  	<option value="Indiana">Indiana University Bloomington</option>
	  	<option value="Iowa">University of Iowa</option>
	  	<option value="Maryland">University of Maryland College Park</option>
	  	<option value="Michigan">University of Michigan</option>
	  	<option value="Michigan State">Michigan State University</option>
	  	<option value="Minnesota">University of Minnesota Twin Cities</option>
	  	<option value="Nebraska">University of Nebraska-Lincoln</option>
	  	<option value="Northwestern">Northwestern University</option>
	  	<option value="Ohio State">The Ohio State University</option>
	  	<option value="Penn State">Penn State University</option>
	  	<option value="Purdue">Purdue University</option>
	  	<option value="Rutgers">Rutgers University</option>
	  	<option value="Wisconsin">University of Wisconsin-Madison</option>
	</select>
	</td>
	</tr>
	
	<tr>
	<td>Position</td><td>
	<select name= "bestp">
		<option value = "C">Center</option>
		<option value = "G">Guard</option>
		<option value = "F">Forward</option>
	</select>
	</td>
	</tr>
	
	</table>
	<br>
	<input type="submit" value="Submit" class="submit">
	</form>
<br>

Insert or Update Player Info:
<form method="post" action="insertupdateindexbasketball.jsp">
    <button type="submit" name="command" value="InsertUpdate">Insert or Update Player Info</button>
    <br>
</form>
<br>

Delete a Player: 
<form method="post" action="deleteindex.jsp">
    <button type="submit" name="command" value="Delete">Delete a Player</button>
    <br>
</form>
<br>
</div>
</body>
</html>