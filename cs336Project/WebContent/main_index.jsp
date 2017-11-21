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
  <a class="active" href="main_index.jsp">Home</a>
  <a href="football_index.jsp">Football</a>
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
    <button type="submit" name="command" value="PlayerData">List of Big 10 Players</button>
    <button type="submit" name="command" value="SchoolData">List of Big 10 Universities</button>
    <br>
</form>

<br>

You can filter for specific players using the fields below. Any fields that you aren't selecting for you can leave empty. Hit submit when you're done creating your query.
<br><br>
	<form method="post" action="playerData.jsp">
	<table>
	<tr>
	<td>Player Name</td><td><input type="text" name="name"></td>
	</tr>
	<tr>    
	<td>Sport</td><td>
<!--  Have a dropdown menu to select the sport -->
	<select name="sport">
		<option value="both">Both</option>
	  	<option value="football">Football</option>
	  	<option value="basketball">Basketball</option>
	</select>
	</td>
	</tr>
	<tr>
	<td>University</td><td>
<!--  Have a dropdown menu to select the university -->
	<select name="university">
		<option value="All">All Big 10 Universities</option>
	  	<option value="Illinois">University of Illinois at Urbana-Champaign</option>
	  	<option value="Indiana">Indiana University Bloomington</option>
	  	<option value="Iowa">University of Iowa</option>
	  	<option value="Maryland">University of Maryland College Park</option>
	  	<option value="Michigan">University of Michigan</option>
	  	<option value="Michigan State">Michigan State University</option>
	  	<option value="Minnesota">University of Minnesota Twin Cities</option>
	  	<option value="Nebraska">University of Nebraska-Lincoln</option>
	  	<option value="Northwestern">Northwestern University</option>
	  	<option value="Ohio">The Ohio State University</option>
	  	<option value="Penn">Penn State University</option>
	  	<option value="Purdue">Purdue University</option>
	  	<option value="Rutgers">Rutgers University</option>
	  	<option value="Wisconsin">University of Wisconsin-Madison</option>
	</select>
	</td>
	</tr>
	<tr>
	<td>Minimum GPA</td><td><input type="text" name="gpa"></td>
	</tr>
	<tr>
	<td>Hometown</td><td><input type="text" name="hometown"></td>
	</tr>
	<tr>
	<!--  Have a dropdown menu to select the major -->
	<td>Major</td><td>
	<select name="major">
	<% String[] all_majors = {"All Majors", "Animal Science", "Biology","Business","Chemical Engineering","Civil Engineering",
			"Communication", "Computer Engineering", "Computer Science", "Creative Writing", "Criminal Justice",
			"Criminology", "Dance", "Economics", "Electrical Engineering", "English", "Exercise Science",
			"Finance", "Gender Studies", "Geography", "History", "ITI", "Industrial Engineering", "Labor Studies",
			"Mechanical Engineering", "Music", "Nutrition", "Political Science", "Psychology", "Public Policy",
			"Sociology", "Sports Management", "Theater"}; 
		for (String major : all_majors) {
			out.print("<option value=\"" + major + "\">" + major + "</option>");
		}
		%>
	</select>
	</td>
	</tr>
	<tr>
	<td>Minimum Crimes Committed</td><td><input type="text" name="crimes"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="Submit" class="submit">
	</form>
<br>

Insert or Update Player Info:
<form method="post" action="insertupdateindex.jsp">
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