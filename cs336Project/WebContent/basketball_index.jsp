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
    <button type="submit" name="command" value="BasketballTeamData">List of Big 10 Basketball Teams</button>
    <br>
    <button type="submit" name="command" value="PlaysForB">List of Big 10 Basketball Players</button>
    <br>
</form>
<br>

Alternatively, enter a basketball player to see their stats!
<br>
	<form method="post" action="PlaysForB.jsp">
	<table>
	<tr>
	<td>University</td><td>
<!--  Have a dropdown menu to select the university -->
	<select>
	  	<option value="Illinois">University of Illinois at Urbana-Champaign</option>
	  	<option value="Indiana">Indiana University Bloomington</option>
	  	<option value="Iowa">University of Iowa</option>
	  	<option value="Maryland">University of Maryland College Park</option>
	  	<option value="Michigan">University of Michigan</option>
	  	<option value="Michigan_State">Michigan State University</option>
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
	<td>Player Name</td><td><input type="text" name="name"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="submit">
	</form>
<br>

Query the basketball teams by record
<br>
	<form method="post" action="query.jsp">
		<select name="price" size=1>
			<option value="3.0">Better than .500 record</option>
			<option value="5.0">Exactly .500 record</option>
			<option value="8.0">Worse than .500 record</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>
<form method="post" action="main_index.jsp">
    <button type="submit" name="command" value="Back">Go back</button>
    <br>
</form>

</body>
</html>