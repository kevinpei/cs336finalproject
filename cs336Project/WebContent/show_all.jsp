<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Table</title>
</head>
<body>
<div class="banner">
	<img src="FUBAR.jpg" />
</div>
<div class="navigation" id="navigationbar">
  <a href="main_index.jsp">Home</a>
  <a href="football_index.jsp">Football</a>
  <a href="basketball_index.jsp">Basketball</a>
</div>
	<%
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("command");
			String[] ordering = entity.split(" ");
			entity = ordering[0];
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM cs336project." + entity;
			if (!(ordering.length == 1)) {
				str += " ORDER BY " + ordering[1] + " ASC";
			}
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table id=\"data\">");
			//Make a row for buttons to order everything by
			out.print("<tr>");
					
			//First row of ordering buttons
			out.print("<td>");
			out.print("<form method=\"post\" action=\"show_all.jsp\">");
			if (entity.equals("PlayerData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlayerData NAME\">Order Alphabetically by Name</button>");
			} else if (entity.equals("SchoolData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"SchoolData SCHOOL\">Order Alphabetically by Name</button>");
			} else if (entity.equals("BasketballTeamData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"BasketballTeamData SCHOOL\">Order Alphabetically by School</button>");
			} else if (entity.equals("FootballTeamData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"FootballTeamData SCHOOL\">Order Alphabetically by School</button>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForF NO\">Order by Player Number</button>");
			}  else if (entity.equals("PlaysForB")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForB NO\">Order by Player Number</button>");
			}
			out.print("</form>");
			out.print("</td>");
					
			//Ordering options in the second row
			out.print("<td>");
			out.print("<form method=\"post\" action=\"show_all.jsp\">");
			if (entity.equals("PlayerData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlayerData HT\">Order by Height</button>");
			} else if (entity.equals("SchoolData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"SchoolData RANK\">Order by School Ranking</button>");
			} else if (entity.equals("BasketballTeamData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"BasketballTeamData COACH\">Order Alphabetically by Coach Name</button>");
			} else if (entity.equals("FootballTeamData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"FootballTeamData COACH\">Order Alphabetically by Coach Name</button>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForF NAME\">Order Alphabetically by Name</button>");
			}  else if (entity.equals("PlaysForB")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForB NAME\">Order Alphabetically by Name</button>");
			}
			out.print("</form>");
			out.print("</td>");
			
			//Ordering options in the third row
			out.print("<td>");
			out.print("<form method=\"post\" action=\"show_all.jsp\">");
			if (entity.equals("PlayerData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlayerData WT\">Order by Weight</button>");
			} else if (entity.equals("SchoolData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"SchoolData ENROLLMENT\">Order by Enrollment</button>");
			} else if (entity.equals("BasketballTeamData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"BasketballTeamData BCOACHPAY\">Order by Coach Salary</button>");
			} else if (entity.equals("FootballTeamData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"FootballTeamData FCOACHPAY\">Order by Coach Salary</button>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForF POS\">Order by Position</button>");
			}  else if (entity.equals("PlaysForB")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForB POS\">Order by Position</button>");
			}
			out.print("</form>");
			out.print("</td>");
			
			//Ordering options in the fourth row
			out.print("<td>");
			out.print("<form method=\"post\" action=\"show_all.jsp\">");
			if (entity.equals("PlayerData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlayerData CLASS\">Order by Class</button>");
			} else if (entity.equals("SchoolData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"SchoolData AVGSAT\">Order by Average SAT Score</button>");
			} else if (entity.equals("BasketballTeamData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"BasketballTeamData WINS\">Order by Wins</button>");
			} else if (entity.equals("FootballTeamData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"FootballTeamData WINS\">Order by Wins</button>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForF SCHOOL\">Order Alphabetically by School</button>");
			}  else if (entity.equals("PlaysForB")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForB SCHOOL\">Order Alphabetically by School</button>");
			}
			out.print("</form>");
			out.print("</td>");
			
			//Ordering options in the fifth row
			out.print("<td>");
			out.print("<form method=\"post\" action=\"show_all.jsp\">");
			if (entity.equals("PlayerData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlayerData HOMETOWN\">Order Alphabetically by Hometown</button>");
			} else if (entity.equals("SchoolData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"SchoolData AVGACT\">Order by Average ACT Score</button>");
			} else if (entity.equals("BasketballTeamData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"BasketballTeamData LOSSES\">Order by Losses</button>");
			} else if (entity.equals("FootballTeamData")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"FootballTeamData LOSSES\">Order by Losses</button>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForF PLAYTIME\">Order by Playing Time</button>");
			}  else if (entity.equals("PlaysForB")) {
				out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForB PLAYTIME\">Order by Playing Time</button>");
			}
			out.print("</form>");
			out.print("</td>");
			
			//Ordering options in the sixth row
			//BasketBallTeamData and FootballTeamData have no more columns, so don't print any more buttons for them
			if (!(entity.equals("BasketballTeamData") || entity.equals("FootballTeamData"))) {
				out.print("<td>");
				out.print("<form method=\"post\" action=\"show_all.jsp\">");
				if (entity.equals("PlayerData")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlayerData STATE\">Order Alphabetically by State</button>");
				} else if (entity.equals("SchoolData")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"SchoolData ACCEPTANCERATE\">Order by Acceptance Rate</button>");
				} else if (entity.equals("PlaysForF")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForF TACKLES\">Order by Number of Tackles</button>");
				} else if (entity.equals("PlaysForB")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForB REBOUNDS\">Order by Number of Rebounds</button>");
				}
				out.print("</form>");
				out.print("</td>");
			}
			
			//Ordering options in the seventh row
			//BasketBallTeamData and FootballTeamData have no more columns, so don't print any more buttons for them
			if (!(entity.equals("BasketballTeamData") || entity.equals("FootballTeamData"))) {
				out.print("<td>");
				out.print("<form method=\"post\" action=\"show_all.jsp\">");
				if (entity.equals("PlayerData")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlayerData SCHOOL\">Order Alphabetically by School Name</button>");
				} else if (entity.equals("SchoolData")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"SchoolData ENDOWMENT\">Order by Endowment Amount</button>");
				} else if (entity.equals("PlaysForF")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForF TOUCHDOWNS\">Order by Number of Touchdowns</button>");
				} else if (entity.equals("PlaysForB")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForB ASSISTS\">Order by Number of Assists</button>");
				}
				out.print("</form>");
				out.print("</td>");
			}
			
			//Ordering options in the eight row
			//BasketBallTeamData and FootballTeamData have no more columns, so don't print any more buttons for them
			if (!(entity.equals("BasketballTeamData") || entity.equals("FootballTeamData"))) {
				out.print("<td>");
				out.print("<form method=\"post\" action=\"show_all.jsp\">");
				if (entity.equals("PlayerData")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlayerData GPA\">Order by GPA</button>");
				} else if (entity.equals("SchoolData")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"SchoolData SPORTSEXPENSES\">Order by Sports Expenses</button>");
				} else if (entity.equals("PlaysForF")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForF FIELD_GOALS\">Order by Number of Field Goals</button>");
				} else if (entity.equals("PlaysForB")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForB BLOCKS\">Order by Number of Blocks</button>");
				}
				out.print("</form>");
				out.print("</td>");
			}
			
			//Ordering options in the ninth row
			//BasketBallTeamData and FootballTeamData have no more columns, so don't print any more buttons for them
			if (!(entity.equals("BasketballTeamData") || entity.equals("FootballTeamData"))) {
				out.print("<td>");
				out.print("<form method=\"post\" action=\"show_all.jsp\">");
				if (entity.equals("PlayerData")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlayerData CRIMES\">Order by Number of Crimes Committed</button>");
				} else if (entity.equals("SchoolData")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"SchoolData FOOTBALLREVENUE\">Order by Football Revenue</button>");
				} else if (entity.equals("PlaysForF")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForF ID_NUM\">Order by School ID Number</button>");
				} else if (entity.equals("PlaysForB")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForB STEALS\">Order by Number of Steals</button>");
				}
				out.print("</form>");
				out.print("</td>");
			}
			
			//Ordering options in the tenth row
			//SchoolData, BasketBallTeamData, and FootballTeamData have no more columns, so don't print any more buttons for them
			if (!(entity.equals("BasketballTeamData") || entity.equals("FootballTeamData") || entity.equals("SchoolData"))) {
				out.print("<td>");
				out.print("<form method=\"post\" action=\"show_all.jsp\">");
				if (entity.equals("PlayerData")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlayerData INJURIES\">Order by Number of Times Injured</button>");
				} else if (entity.equals("PlaysForF")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForF DEPTH_CHART\">Order by Player Status</button>");
				} else if (entity.equals("PlaysForB")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForB FOULS\">Order by Number of Fouls</button>");
				}
				out.print("</form>");
				out.print("</td>");
			}
			
			//Ordering options in the eleventh row
			//SchoolData, BasketBallTeamData, and FootballTeamData have no more columns, so don't print any more buttons for them
			if (!(entity.equals("BasketballTeamData") || entity.equals("FootballTeamData") || entity.equals("SchoolData") || entity.equals("PlaysForF"))) {
				out.print("<td>");
				out.print("<form method=\"post\" action=\"show_all.jsp\">");
				if (entity.equals("PlayerData")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlayerData ID_NUM\">Order by School ID Number</button>");
				} else if (entity.equals("PlaysForB")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForB TURNOVERS\">Order by Number of Turnovers</button>");
				}
				out.print("</form>");
				out.print("</td>");
			}
			
			//Ordering options in the twelfth row
			//PlaysForF, SchoolData, BasketBallTeamData, and FootballTeamData have no more columns, so don't print any more buttons for them
			if (!(entity.equals("BasketballTeamData") || entity.equals("FootballTeamData") || entity.equals("SchoolData") || entity.equals("PlaysForF"))) {
				out.print("<td>");
				out.print("<form method=\"post\" action=\"show_all.jsp\">");
				if (entity.equals("PlayerData")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlayerData MAJOR\">Order Alphabetically by Major</button>");
				} else if (entity.equals("PlaysForB")) {
					out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForB POINTS\">Order by Number of Points Scored</button>");
				}
				out.print("</form>");
				out.print("</td>");
			}
			
			//Ordering options in the thirteenth row
			//PlayerData, PlaysForF, SchoolData, BasketBallTeamData, and FootballTeamData have no more columns, so don't print any more buttons for them
			if (entity.equals("PlaysForB")) {
				out.print("<td>");
				out.print("<form method=\"post\" action=\"show_all.jsp\">");
				out.print("<button type=\"submit\" name=\"command\" value=\"PlaysForB ID_NUM\">Order by School ID Number</button>");
				out.print("</form>");
				out.print("</td>");
			}
			out.print("</tr>");
			//make a table header
			out.print("<tr>");
			
			//Depending on the radio button selection make different headers for each table
			
			//print out column headers
			//Print out the first column
			out.print("<th>");
			if (entity.equals("PlaysForF") || entity.equals("PlaysForB")) {
				out.print("Number");
			} else {
				out.print("Name");
			}
			out.print("</th>");
			
			//Print out the second column
			out.print("<th>");
			if (entity.equals("PlayerData")) {
				out.print("Height");
			} else if (entity.equals("SchoolData")) {
				out.print("Rank");
			} else if (entity.equals("PlaysForF") || entity.equals("PlaysForB")) {
				out.print("Name");
			} else {
				out.print("Coach");
			}
			out.print("</th>");
			
			//Print out the third column
			out.print("<th>");
			if (entity.equals("PlayerData")) {
				out.print("Weight");
			} else if (entity.equals("SchoolData")) {
				out.print("Enrollment");
			} else if (entity.equals("PlaysForF") || entity.equals("PlaysForB")) {
				out.print("Position");
			} else {
				out.print("Coach's Pay");
			}
			out.print("</th>");
			
			//Print out the fourth column
			out.print("<th>");
			if (entity.equals("PlayerData")) {
				out.print("Class");
			} else if (entity.equals("SchoolData")) {
				out.print("Average SAT Score");
			} else if (entity.equals("PlaysForF") || entity.equals("PlaysForB")) {
				out.print("School");
			} else {
				out.print("2016 Wins");
			}
			out.print("</th>");
			
			//Print out the fifth column
			out.print("<th>");
			if (entity.equals("PlayerData")) {
				out.print("Hometown");
			} else if (entity.equals("SchoolData")) {
				out.print("Average ACT Score");
			} else if (entity.equals("PlaysForF") || entity.equals("PlaysForB")) {
				out.print("Play Time");
			} else {
				out.print("2016 Losses");
			}
			out.print("</th>");
			
			//Print out the sixth column
			if (entity.equals("PlayerData")) {
				out.print("<th>State</th>");
			} else if (entity.equals("SchoolData")) {
				out.print("<th>Acceptance Rate</th>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<th>Tackles</th>");
			} else if (entity.equals("PlaysForB")){
				out.print("<th>Rebounds</th>");
			}
			
			//Print out the seventh column
			if (entity.equals("PlayerData")) {
				out.print("<th>School</th>");
			} else if (entity.equals("SchoolData")) {
				out.print("<th>Endowment</th>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<th>Touchdowns</th>");
			} else if (entity.equals("PlaysForB")){
				out.print("<th>Assists</th>");
			}
			
			//Print out the eighth column
			if (entity.equals("PlayerData")) {
				out.print("<th>GPA</th>");
			} else if (entity.equals("SchoolData")) {
				out.print("<th>Sports Expenses</th>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<th>Field Goals</th>");
			} else if (entity.equals("PlaysForB")){
				out.print("<th>Blocks</th>");
			}
			
			//Print out the ninth column
			if (entity.equals("PlayerData")) {
				out.print("<th>Crimes Committed</th>");
			} else if (entity.equals("SchoolData")) {
				out.print("<th>Football Revenue</th>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<th>School ID</th>");
			} else if (entity.equals("PlaysForB")){
				out.print("<th>Steals</th>");
			}
			
			//Print out the tenth column
			if (entity.equals("PlayerData")) {
				out.print("<th>Injuries</th>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<th>Player Status</th>");
			} else if (entity.equals("PlaysForB")){
				out.print("<th>Fouls</th>");
			}
			
			//Print out the eleventh column
			if (entity.equals("PlayerData")) {
				out.print("<th>School ID</th>");
			} else if (entity.equals("PlaysForB")){
				out.print("<th>Turnovers</th>");
			}
			
			//Print out the twelfth column
			if (entity.equals("PlayerData")) {
				out.print("<th>Major</th>");
			} else if (entity.equals("PlaysForB")){
				out.print("<th>Points</th>");
			}
			
			//Print out the thirteenth column
			if (entity.equals("PlaysForB")) {
				out.print("<th>School ID</th>");
			}
			
			out.print("</tr>");
			
			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				
				//make a column
				//Print out the first column
				out.print("<td>");
				if (entity.equals("PlaysForF") || entity.equals("PlaysForB")) {
					out.print(result.getString("NO"));
				} else if (entity.equals("PlayerData")){
					out.print(result.getString("NAME"));
				} else {
					out.print(result.getString("SCHOOL"));
				}
				out.print("</td>");
				
				//Print out the second column
				out.print("<td>");
				if (entity.equals("PlayerData")) {
					out.print(result.getString("HT"));
				} else if (entity.equals("SchoolData")) {
					out.print(result.getString("RANK"));
				} else if (entity.equals("PlaysForF") || entity.equals("PlaysForB")) {
					out.print(result.getString("NAME"));
				} else {
					out.print(result.getString("COACH"));
				}
				out.print("</td>");
				
				//Print out the third column
				out.print("<td>");
				if (entity.equals("PlayerData")) {
					out.print(result.getString("WT"));
				} else if (entity.equals("SchoolData")) {
					out.print(result.getString("ENROLLMENT"));
				} else if (entity.equals("BasketballTeamData")) {
					out.print(result.getString("BCOACHPAY"));
				} else if (entity.equals("FootballTeamData")) {
					out.print(result.getString("FCOACHPAY"));
				} else {
					out.print(result.getString("POS"));
				}
				out.print("</td>");
				
				//Print out the fourth column
				out.print("<td>");
				if (entity.equals("PlayerData")) {
					out.print(result.getString("CLASS"));
				} else if (entity.equals("SchoolData")) {
					out.print(result.getString("AVGSAT"));
				} else if (entity.equals("PlaysForF") || entity.equals("PlaysForB")) {
					out.print(result.getString("SCHOOL"));
				} else {
					out.print(result.getString("WINS"));
				}
				out.print("</td>");
				
				//Print out the fifth column
				out.print("<td>");
				if (entity.equals("PlayerData")) {
					out.print(result.getString("HOMETOWN"));
				} else if (entity.equals("SchoolData")) {
					out.print(result.getString("AVGACT"));
				} else if (entity.equals("PlaysForF") || entity.equals("PlaysForB")) {
					out.print(result.getString("PLAYTIME"));
				} else {
					out.print(result.getString("LOSSES"));
				}
				out.print("</td>");
				
				//Print out the sixth column
				if (entity.equals("PlayerData")) {
					out.print("<td>" + result.getString("STATE") + "</td>");
				} else if (entity.equals("SchoolData")) {
					out.print("<td>" + result.getString("ACCEPTANCERATE") + "</td>");
				} else if (entity.equals("PlaysForF")) {
					out.print("<td>" + result.getString("TACKLES") + "</td>");
				} else if (entity.equals("PlaysForB")){
					out.print("<td>" + result.getString("REBOUNDS") + "</td>");
				}
				
				//Print out the seventh column
				if (entity.equals("PlayerData")) {
					out.print("<td>" + result.getString("SCHOOL") + "</td>");
				} else if (entity.equals("SchoolData")) {
					out.print("<td>" + result.getString("ENDOWMENT") + "</td>");
				} else if (entity.equals("PlaysForF")) {
					out.print("<td>" + result.getString("TOUCHDOWNS") + "</td>");
				} else if (entity.equals("PlaysForB")){
					out.print("<td>" + result.getString("ASSISTS") + "</td>");
				}
				
				//Print out the eighth column
				if (entity.equals("PlayerData")) {
					out.print("<td>" + result.getString("GPA") + "</td>");
				} else if (entity.equals("SchoolData")) {
					out.print("<td>" + result.getString("SPORTSEXPENSES") + "</td>");
				} else if (entity.equals("PlaysForF")) {
					out.print("<td>" + result.getString("FIELD_GOALS") + "</td>");
				} else if (entity.equals("PlaysForB")){
					out.print("<td>" + result.getString("BLOCKS") + "</td>");
				}
				
				//Print out the ninth column
				if (entity.equals("PlayerData")) {
					out.print("<td>" + result.getString("CRIMES") + "</td>");
				} else if (entity.equals("SchoolData")) {
					out.print("<td>" + result.getString("FOOTBALLREVENUE") + "</td>");
				} else if (entity.equals("PlaysForF")) {
					String id = result.getString("ID_NUM");
					while (id.length() < 9)
						id = "0" + id;
					out.print("<td>" + id + "</td>");
				} else if (entity.equals("PlaysForB")){
					out.print("<td>" + result.getString("STEALS") + "</td>");
				}
				
				//Print out the tenth column
				if (entity.equals("PlayerData")) {
					out.print("<td>" + result.getString("INJURIES") + "</td>");
				} else if (entity.equals("PlaysForF")) {
					out.print("<td>" + result.getString("DEPTH_CHART") + "</td>");
				} else if (entity.equals("PlaysForB")){
					out.print("<td>" + result.getString("FOULS") + "</td>");
				}
				
				//Print out the eleventh column
				if (entity.equals("PlayerData")) {
					String id = result.getString("ID_NUM");
					while (id.length() < 9)
						id = "0" + id;
					out.print("<td>" + id + "</td>");
				} else if (entity.equals("PlaysForB")){
					out.print("<td>" + result.getString("TURNOVERS") + "</td>");
				}
				
				//Print out the twelfth column
				if (entity.equals("PlayerData")) {
					out.print("<td>" + result.getString("MAJOR") + "</td>");
				} else if (entity.equals("PlaysForB")){
					out.print("<td>" + result.getString("POINTS") + "</td>");
				}
				
				//Print out the thirteenth column
				if (entity.equals("PlaysForB")) {
					String id = result.getString("ID_NUM");
					while (id.length() < 9)
						id = "0" + id;
					out.print("<td>" + id + "</td>");
				}
				out.print("</tr>");
			}
			out.print("</table>");
			//close the connection.
			db.closeConnection(con);
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>