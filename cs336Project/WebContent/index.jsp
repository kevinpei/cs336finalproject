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
<% out.println("Kevin!"); %> <!-- output the same thing, but using 
                                      jsp programming -->

									  
<br>
 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
<!-- forms are used to collect user input 
	The default method when submitting form data is GET.
	However, when GET is used, the submitted form data will be visible in the page address field-->
<form method="post" action="show.jsp">
    <!-- note the show.jsp will be invoked when the choice is made -->
	<!-- The next lines give HTML for radio buttons being displayed -->
  <input type="radio" name="command" value="PlayForB"/>List of BIG10 Basketball Players!
  <br>
  <input type="radio" name="command" value="SchoolData"/>List of BIG10 Universities!
    <!-- when the radio for bars is chosen, then 'command' will have value 
     | 'bars', in the show.jsp file, when you access request.parameters -->
  <br>
  <input type="submit" value="submit" />  
</form>
<br>

Alternatively, enter a player to see their stats!
<br>
	<form method="post" action="newBeer.jsp">
	<table>
	<tr>    
	<td>Sport</td><td><input type="text" name="bar"></td>
	</tr>
	<tr>
	<td>University</td><td><input type="text" name="beer"></td>
	</tr>
	<tr>
	<td>Player Name</td><td><input type="text" name="price"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="submit">
	</form>
<br>

Query the teams by record
<br>
	<form method="post" action="query.jsp">
		<select name="price" size=1>
			<option value="3.0">Better than .500 record</option>
			<option value="5.0">Exactly .500 record</option>
			<option value="8.0">Worse than .500 record</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

</body>
</html>