<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Basketball</title>
</head>
<body>
<div class="banner">
	<img src="FUBAR.jpg" />
</div>
<div class="navigation" id="navigationbar">
  <a href="main_index.jsp">Home</a>
  <a href="football_administrator_index.jsp">Football for Administrators and Fans</a>
  <a class="active" href="basketball_administrator_index.jsp">Basketball for Administrators and Fans</a>
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
<% out.println("B1G Sports Fan!"); %> <!-- output the same thing, but using 
                                      jsp programming -->

Click here to get a list of all Big 10 basketball players and universities.
<form method="post" action="show_all.jsp">
    <button type="submit" name="command" value="BasketballTeamData">List of Big 10 Basketball Teams</button>
    <button type="submit" name="command" value="PlaysForB">List of Big 10 Basketball Players</button>
    <br>
</form>
<br>

<% out.println("Alternatively, select a basketball team to see their roster!");%> 
<br> 
	<form method="post" action="bquery.jsp">
	<table>
	<tr>
	<td>University</td><td>
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
	
	<tr>
	<td>Position</td><td>
	<select name= "Position">
		<option value = "A">All Positions</option>
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



<% out.println("Look up BIG10 Non-Athletic Average Statistics! ");%> 
<br> 
	<form method="post" action="bqueryavgs.jsp">
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




Have you ever wondered how the amount of money a sports team gets
impacts the teams performance? Use the dropdown menu below to see how the various kinds of finances affect the 
record of your basketball team.
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


<% out.println("Select a school to see which states most of their players are from!");%> 
<br> 
	<form method="post" action="bqueryhomestate.jsp">
	<table>
	<tr>
	<td></td><td>
<!--  Have a dropdown menu to select the university -->
	<select name="University">
		<option value="Select">Select</option>
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


<br>
In basketball, there are 3 major positions: Guard, Forward and Center <br>
Each of these positions plays a different role and contributes in a different way.
Now let's see how much each position contributes to a few of the teams main stats.
<br> 
	<form method="post" action="bballrankpos.jsp">
	<table>
	<tr>
	<td></td><td>
<!--  Have a dropdown menu to select the university -->
	<select name="OrderingStat">
	  	<option value="points">Order by Points</option>
	  	<option value="assists">Order by Assists</option>
	  	<option value="rebounds">Order by Rebounds</option>
	</select>
	</td>
	</tr>
	
	</table>
	<br>
	<input type="submit" value="Submit" class="submit">
	</form>
<br>





Find the best players on each team by position! A players ranking is determined by taking
 a variety of factors into account, including points, assists, rebounds, steals and turnovers per game!
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


<% out.println("Find players by with the attributes that you choose!");%> 
<br> 
	<form method="post" action="bscreener.jsp">
	<table>

	<tr>
	<td>Position</td><td>
	<select name= "Position">
		<option value = "A">Any Position</option>
		<option value = "C">Center</option>
		<option value = "G">Guard</option>
		<option value = "F">Forward</option>
	</select>
	</td>
	</tr>
	
	<tr>
	<td>Weight</td><td>
	<select name= "weight">
		<option value = "150">150-160</option>
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
		<option value = "290">290-300</option>
	</select>
	</td>
	</tr>
	
	
	<tr>
	<td>Height</td><td>
	<select name= "height">
		<option value = "70">5'10"</option>
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
		<option value = "87">7'3"</option>
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