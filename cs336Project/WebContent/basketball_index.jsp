<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fubar</title>
</head>
<body>
Hello <!-- the usual HTML way -->
<% out.println("user!"); %> <!-- output the same thing, but using 
                                      jsp programming -->

Click here to get all Big 10 basketball players and schools.
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
	<input type="submit" value="submit">
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
	<input type="submit" value="submit">
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
	<input type="submit" value="submit">
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
	<input type="submit" value="submit">
	</form>
<br>




<form method="post" action="main_index.jsp">
    <button type="submit" name="command" value="Back">Go back</button>
    <br>
</form>

</body>
</html>