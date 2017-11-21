<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fubar</title>
</head>
<body>
<div class="banner">
	<img src="FUBAR.jpg" />
</div>
<div class="navigation" id="navigationbar">
  <a href="main_index.jsp">Home</a>
  <a class="active" href="football_index.jsp">Football</a>
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
Hello <!-- the usual HTML way -->
<% out.println("user!"); %> <!-- output the same thing, but using 
                                      jsp programming -->

Click one of the buttons below to get all the info on a certain topic.									  
<br>
 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
<!-- forms are used to collect user input 
	The default method when submitting form data is GET.
	However, when GET is used, the submitted form data will be visible in the page address field-->
<form method="post" action="show_all.jsp">
    <button type="submit" name="command" value="FootballTeamData">List of Big 10 Football Teams</button>
    <button type="submit" name="command" value="PlaysForF">List of Big 10 Football Players</button>
    <br>
</form>
<br>

Alternatively, select a football team to see their roster!
<br> 
	<form method="post" action="fquery.jsp">
	<table>
	<tr>
	<td>University</td><td>
<!--  Have a dropdown menu to select the university -->
	<select name="FUniversity">
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
	<select name= "FPosition">
		<option value = "All">All Positions</option>
		<option value = "C">Center</option>
		<option value = "CB">Corner Back</option>
		<option value = "DB">Defensive Back</option>
		<option value = "DE">Defensive End</option>
		<option value = "DL">Defensive Line</option>
		<option value = "DT">Defensive Tackle</option>
		<option value = "FB">Full Back</option>
		<option value = "G">Guard</option>
		<option value = "LB">Line Backer</option>
		<option value = "LS">Long Snapper</option>
		<option value = "NT">Nose Tackle</option>
		<option value = "OL">Offensive Line</option>
		<option value = "OT">Offensive Tackle</option>
		<option value = "P">Punter</option>
		<option value = "PK">Place Kicker</option>
		<option value = "QB">Quarter Back</option>
		<option value = "RB">Running Back</option>
		<option value = "S">Safety</option>
		<option value = "TE">Tight End</option>
		<option value = "WR">Wide Receiver</option>
	</select>
	</td>
	</tr>
	</table>
	<br>
	<input type="submit" value="Submit" class="submit">
	</form>
<br>



<% out.println("Look up BIG10 Non-Athletic Average Statistics! ");%> 
<br> 
	<form method="post" action="fqueryavgs.jsp">
	<table>
	<tr>
	<td></td><td>
<!--  Have a dropdown menu to select the university -->
	<select name="AvgStat">
	  	<option value="Averages by Team">Averages by Team</option>
	  	<option value="Averages by Position">Averages by Position</option>
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
	<form method="post" action="fqueryfinance.jsp">
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



<% out.println("Find the best player on each team by position and stat! ");%> 
<br> 
	<form method="post" action="fquerybest.jsp">
	<table>
	<tr>
	<td>University</td><td>
<!--  Have a dropdown menu to select the university -->
	<select name="BestUniversity">
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
	<select name= "BestPosition">
		<option value = "All">All Positions</option>
		<option value = "C">Center</option>
		<option value = "CB">Corner Back</option>
		<option value = "DB">Defensive Back</option>
		<option value = "DE">Defensive End</option>
		<option value = "DL">Defensive Line</option>
		<option value = "DT">Defensive Tackle</option>
		<option value = "FB">Full Back</option>
		<option value = "G">Guard</option>
		<option value = "LB">Line Backer</option>
		<option value = "LS">Long Snapper</option>
		<option value = "NT">Nose Tackle</option>
		<option value = "OL">Offensive Line</option>
		<option value = "OT">Offensive Tackle</option>
		<option value = "P">Punter</option>
		<option value = "PK">Place Kicker</option>
		<option value = "QB">Quarter Back</option>
		<option value = "RB">Running Back</option>
		<option value = "S">Safety</option>
		<option value = "TE">Tight End</option>
		<option value = "WR">Wide Receiver</option>
	</select>
	</td>
	</tr>
	
	<tr>
	<td>Stat</td><td>
	<select name= "BestStat">
		<option value = "All">All Stats</option>
		<option value = "TACKLES">Tackles</option>
		<option value = "TOUCHDOWNS">Touchdowns</option>
		<option value = "FIELD_GOALS">Field Goals</option>
	</select>
	</td>
	</tr>
	
	</table>
	<br>
	<input type="submit" value="Submit" class="submit">
	</form>
<br>
</div>
</body>
</html>