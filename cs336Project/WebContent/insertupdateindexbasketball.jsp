<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert or Update Player Information</title>
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
<div>
<img class="football_background" src="football_player.jpg" />
</div>
<div>
<img class="basketball_background" src="basketball_player.jpg" />
</div>
<div class="body">
<br>
<% out.println("To insert a player, you must enter the player's university, school ID, name, position, and jersey number. If you do not enter " +
"anything for the other fields, they will be given default values of 0 or --, or 1.00 for GPA.");%> 
<br><br>
<% out.println("To update a player, enter a player's school and student ID number. Then fill in any other fields that you wish to change.");%> 
<br> 
	<form method="post" action="insertupdatequerybasketball.jsp">
	<table>
	<tr>
	<td>University</td><td>
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
		
	<tr>
	<td>Student ID Number</td><td><input type="text" name="idnum"></td>
	</tr>
	
	
	<tr>
	<td>Player Name</td><td><input type="text" name="name"></td>
	</tr>
	
	<tr>
	<td>Position</td><td>
	<select name= "Position">
		<option value="Select">Select</option>
		<option value = "C">Center</option>
		<option value = "G">Guard</option>
		<option value = "F">Forward</option>
	</select>
	</td>
	</tr>
	
	<tr>
	<td>Jersey Number</td><td><input type="int" name="number"></td>
	</tr>
	
	<tr>
	<td>Home town</td><td><input type="text" name="town"></td>
	</tr>
	
	
	<tr>
	<td>Home State</td><td>
<!--  Have a dropdown menu to select the university -->
	<select name="state">
		<option value="Select">Select</option>
	  	<option value="AL">Alabama</option>
	  	<option value="AK">Alaska</option>
	  	<option value="AZ">Arizona</option>
	  	<option value="AR">Arkansas</option>
	  	<option value="CA">California</option>
	  	<option value="CO">Colorado</option>
	  	<option value="CT">Connecticut</option>
	  	<option value="DE">Delaware</option>
	  	<option value="FL">Florida</option>
	  	<option value="GA">Georgia</option>
	  	<option value="HI">Hawaii</option>
	  	<option value="ID">Idaho</option>
	  	<option value="IL">Illinois</option>
	  	<option value="IN">Indiana</option>
		<option value="IA">Iowa</option>
	  	<option value="KS">Kansas</option>
	  	<option value="KY">Kentucky</option>
	  	<option value="LA">Louisiana</option>
	  	<option value="ME">Maine</option>
	  	<option value="MD">Maryland</option>
	  	<option value="MA">Massachusetts</option>
	  	<option value="MI">Michigan</option>
	  	<option value="MN">Minnesota</option>
	  	<option value="MS">Mississippi</option>
	  	<option value="MO">Missouri</option>
	  	<option value="MT">Montana</option>
	  	<option value="NE">Nebraska</option>
	  	<option value="NV">Nevada</option>
	  	<option value="NH">New Hampshire</option>
	  	<option value="NJ">New Jersey</option>
	  	<option value="NM">New Mexico</option>
	  	<option value="NY">New York</option>
	  	<option value="NC">North Carolina</option>
	  	<option value="ND">North Dakota</option>
	  	<option value="OH">Ohio</option>
		<option value="OK">Oklahoma</option>
	  	<option value="OR">Oregon</option>
	  	<option value="PA">Pennsylvania</option>
	  	<option value="RI">Rhode Island</option>
	  	<option value="SC">South Carolina</option>
	  	<option value="SC">South Dakota</option>
	  	<option value="TN">Tennessee</option>
	  	<option value="TX">Texas</option>
	  	<option value="UT">Utah</option>
	  	<option value="VT">Vermont</option>
	  	<option value="VA">Virginia</option>
	  	<option value="WA">Washington</option>
	  	<option value="WV">West Virginia</option>
	  	<option value="WI">Wisconsin</option>
	  	<option value="WY">Wyoming</option>	
	  	<option value="Other">Other</option>
	</select>
	</td>
	</tr>
	
	<tr>
	<td>Height (in.)</td><td><input type="int" name="height"></td>
	</tr>
	
	<tr>
	<td>Weight (lbs.)</td><td><input type="int" name="weight"></td>
	</tr>
	
	
	<tr>
	<td>Class</td><td>
<!--  Have a dropdown menu to select the university -->
	<select name="class">
		<option value="Select">Select</option>
	  	<option value="FR">Freshman</option>
	  	<option value="SO">Sophomore</option>
	  	<option value="JR">Junior</option>
	  	<option value="SR">Senior</option>
	</select>
	</td>
	</tr>
	
	
	<tr>
	<td>Major</td><td><input type="text" name="major"></td>
	</tr>
	
	<tr>
	<td>GPA</td><td><input type="text" name="gpa"></td>
	</tr>
	
	<tr>
	<td>Crimes Committed</td><td><input type="text" name="crimes"></td>
	</tr>
	
	<tr>
	<td>Number of Injuries</td><td><input type="text" name="injuries"></td>
	</tr>
	
	<tr>
	<td>Average Playtime</td><td><input type="text" name="playtime"></td>
	</tr>
	
	<tr>
	<td>Average Rebounds per Game</td><td><input type="text" name="rebounds"></td>
	</tr>
	
	<tr>
	<td>Average Assists per Game</td><td><input type="text" name="assists"></td>
	</tr>
	
	<tr>
	<td>Average Blocks per Game</td><td><input type="text" name="blocks"></td>
	</tr>
	
	<tr>
	<td>Average Steals per Game</td><td><input type="text" name="steals"></td>
	</tr>
	
	<tr>
	<td>Average Fouls per Game</td><td><input type="text" name="fouls"></td>
	</tr>
	
	<tr>
	<td>Average Turnovers per Game</td><td><input type="text" name="turnovers"></td>
	</tr>
	
	<tr>
	<td>Average Points Scored per Game</td><td><input type="text" name="points"></td>
	</tr>
	
	</table>
	<br>
	<input type="submit" value="Insert" class="submit" name="Insert">
	<input type="submit" value="Update" class="submit" name="Update">
	</form>
	
	
<br>
	
</div>
</body>
</html>