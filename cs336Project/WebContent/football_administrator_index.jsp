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
  <a class="active" href="football_administrator_index.jsp">Football for Administrators</a>
  <a href="basketball_administrator_index.jsp">Basketball for Administrators</a>
</div>
<div>
<img class="football_background" src="football_player.jpg" />
</div>
<div>
<img class="basketball_background" src="basketball_player.jpg" />
</div>
<div class="body">
<br>
Hello Big 10 administrator. This section of the website is for those who want to improve the performance of their teams for the least cost.
<br><br>
Select one of the buttons below to see all Big 10 Football teams or players and their stats. 
<form method="post" action="show_all.jsp">
    <button type="submit" name="command" value="FootballTeamData">List of Big 10 Football Teams</button>
    <button type="submit" name="command" value="PlaysForF">List of Big 10 Football Players</button>
    <br>
</form>
<br><br>
Alternatively, you can selectively see the stats for certain schools or positions.
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
<br>
If you're looking for a particular player, use the tool below to narrow down your search.
<br> 
	<form method="post" action="fscreener.jsp">
	<table>

	<tr>
	<td>Position</td><td>
	<select name= "Position">
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
	<td>Weight</td><td>
	<select name= "weight">
		<option value = "150">160 and below</option>
		<option value = "160">160-170</option>
		<option value = "170">170-180</option>
		<option value = "180">180-190</option>
		<option value = "190">190-200</option>
		<option value = "200">200-210</option>
		<option value = "210">210-220</option>
		<option value = "220">220-230</option>
		<option value = "230">230-240</option>
		<option value = "240">240-250</option>
		<option value = "250">250-260</option>
		<option value = "260">260-270</option>
		<option value = "270">270-280</option>
		<option value = "280">280-290</option>
		<option value = "290">290 and above</option>
	</select>
	</td>
	</tr>
	
	
	<tr>
	<td>Height</td><td>
	<select name= "height">
		<option value = "70">5'10" and below</option>
		<option value = "71">5'11"</option>
		<option value = "72">6'0"</option>
		<option value = "73">6'1"</option>
		<option value = "74">6'2"</option>
		<option value = "75">6'3"</option>
		<option value = "76">6'4"</option>
		<option value = "77">6'5"</option>
		<option value = "78">6'6"</option>
		<option value = "79">6'7"</option>
		<option value = "80">6'8"</option>
		<option value = "81">6'9"</option>
		<option value = "82">6'10"</option>
		<option value = "83">6'11"</option>
		<option value = "84">7'0"</option>
		<option value = "85">7'1"</option>
		<option value = "86">7'2"</option>
		<option value = "87">7'3" and above</option>
	</select>
	</td>
	
	
	<tr>
	<td>GPA</td><td>
	<select name= "gpa">
		<option value = "2">less than 2.0</option>
		<option value = "2.5">2.0-2.5</option>
		<option value = "3">2.5-3.0</option>
		<option value = "3.5">3.0-3.5</option>
		<option value = "4">3.5-4.0</option>
	</select>
	</td>
	
	
	
	</table>
	<br>
	<input type="submit" value="Submit" class="submit">
	</form>
<br>
<br>
If you're looking for more specific information on how to improve your football team, take a look at the queries below.
<br><br><br>
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
<br>
Have you ever wondered who the best player on your team is? Use this tool to see who has the most tackles, touchdowns, or field goals
on your football team. You can select a university, position, and stat. Choose all universities to see the best player from all schools,
all positions to choose the best player from any position, and all stats to add tackles, touchdowns, and field goals together when
determining the best player.
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
<br>
What makes a player good? Why not start with weight and height? Try and see which is the better determinant of tackles, touchdowns, and field goals.
<br> 
	<form method="post" action="height_weight_football.jsp">
	<table>
	<tr>
	<select name= "BestStat">
		<option value = "Height">Height</option>
		<option value = "Weight">Weight</option>
	</select>
	</tr>
	
	</table>
	<br>
	<input type="submit" value="Submit" class="submit">
	</form>
<br>
<br>
<% out.println("Select a school to see which states most of their players are from. If a school is beating you, try " + 
"recruiting from home states they frequently recruit from.");%> 
<br> 
	<form method="post" action="fqueryhomestate.jsp">
	<table>
	<tr>
	<td></td><td>
<!--  Have a dropdown menu to select the university -->
	<select name="University">
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
	
	</table>
	<br>
	<input type="submit" value="Submit" class="submit">
	</form>
<br>

Have you ever wondered what the best use of university money was? Have you ever wondered how the amount of money you get determines
how good of a football team you have? Use the dropdown menu below to see how the various kinds of finances affect the 
performance of your football team.
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
<br>
As an administrator, it's your job to not only care about improving the football team's performance, but also to keep track of 
a student's GPA, how many times they've been injured, and how many crimes they've committed. Here, you can see how a student's injury
record affects their GPA.
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
<br><br>
What really determines a student's criminal record? Since it's tied to which school they go to, let's investigate:
<br>
<form method="post" action="football_crime_determinant.jsp">
	<input type="submit" value="What Determines a Player's Criminal Record?" class="submit">
	</form>
<br><br>
Now that we know what determines a player's stats, add new players to your team in a more intelligent way! 
<br><br>
Insert or Update Player Info:
<form method="post" action="insertupdateindexfootball.jsp">
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