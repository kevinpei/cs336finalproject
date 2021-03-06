<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert or Update Player Information</title>
</head>
<body>

<% out.println("To insert a player, select the team that you want to add a player to and fill in the boxes!");%> 
<% out.println("To update a player, enter a player's student ID number and select a school and sport!");%> 
<br> 
	<form method="post" action="insertupdatequery.jsp">
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
	<td>Sport</td><td>
	<select name= "sport">
		<option value = "Select">Select</option>
		<option value = "Basketball">Basketball</option>
		<option value = "Football">Football</option>
	</select>
	</td>
	</tr>
	
	
	<tr>
	<td>Player Name</td><td><input type="text" name="name"></td>
	</tr>
	
	<tr>
	<td>Position</td><td>
	<select name= "Position">
		<option value = "">Select</option>
		<option value = "C">Center</option>
		<option value = "G">Guard</option>
		<option value = "F">Forward</option>
		
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
	<td>Jersey Number</td><td><input type="int" name="number"></td>
	</tr>
	
	<tr>
	<td>Home town</td><td><input type="text" name="town"></td>
	</tr>
	
	
	<tr>
	<td>Home State/Country</td><td>
<!--  Have a dropdown menu to select the university -->
	<select name="state">
		<option value="">Select</option>
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
	  	<option value="WV">Europe</option>
	  	<option value="WI">Asia</option>
	  	<option value="WY">Africa</option>  	
	  	<option value="WV">South America</option>
	  	<option value="WI">Central America</option>
	  	<option value="WI">Mexico</option>
	  	<option value="WI">Canada</option>
	  	<option value="WI">Poland</option>
	  	<option value="WY">Other</option>
	</select>
	</td>
	</tr>
	
	<tr>
	<td>Height</td><td><input type="int" name="height"></td>
	</tr>
	
	<tr>
	<td>Weight</td><td><input type="int" name="weight"></td>
	</tr>
	
	
	<tr>
	<td>Class</td><td>
<!--  Have a dropdown menu to select the university -->
	<select name="class">
		<option value="">Select</option>
	  	<option value="Freshman">Freshman</option>
	  	<option value="Sophomore">Sophomore</option>
	  	<option value="Junior">Junior</option>
	  	<option value="Senior">Senior</option>
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
	<td>Student ID Number</td><td><input type="text" name="idnum"></td>
	</tr>
	
	
	</table>
	<br>
	<input type="submit" value="Insert" name="Insert">
	<input type="submit" value="Update" name="Update">
	</form>
	
	
<br>
	

</body>
</html>