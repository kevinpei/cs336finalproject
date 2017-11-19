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

Click one of the buttons below to get all the info on a certain topic.									  
<br>
 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
<!-- forms are used to collect user input 
	The default method when submitting form data is GET.
	However, when GET is used, the submitted form data will be visible in the page address field-->
<form method="post" action="show_all.jsp">
    <button type="submit" name="command" value="PlayerData">List of Big 10 Players</button>
    <br>
    <button type="submit" name="command" value="SchoolData">List of Big 10 Universities</button>
    <br>
</form>

<br>

Alternatively, enter a player to see their stats!
<br>
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
	<input type="submit" value="submit">
	</form>
<br>

See the stats for each university!
<br>
	<form method="post" action="schools.jsp">
	<table>
		<tr>
		<td>Minimum Rank</td><td><input type="text" name="rank"></td>
		</tr>
		<tr>
		<td>Minimum Enrollment</td><td><input type="text" name="enrollment"></td>
		</tr>
		<tr>
		<td>Minimum SAT Scores</td><td><input type="text" name="sat"></td>
		</tr>
		<tr>
		<td>Minimum Endowment</td><td><input type="text" name="endowment"></td>
		</tr>
	</table>
	</form>
<br>

See stats for teams:
<form method="post" action="football_index.jsp">
    <button type="submit" name="command" value="Football">Big 10 Football Teams</button>
    <br>
</form>
<form method="post" action="basketball_index.jsp">
    <button type="submit" name="command" value="Basketball">Big 10 Basketball Teams</button>
    <br>
</form>

</body>
</html>