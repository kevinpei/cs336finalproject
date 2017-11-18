<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>show.jsp Window</title>
</head>
<body>
	<%
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		

			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the selected radio button from the index.jsp
			String entity = request.getParameter("command");
			//Make a SELECT query from the table specified by the 'command' parameter at the index.jsp
			String str = "SELECT * FROM cs336project." + entity;
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			
			//Depending on the radio button selection make different headers for each table
			
			//print out column headers
			//Print out the first column
			out.print("<td>");
			if (entity.equals("PlaysForF") || entity.equals("PlaysForB")) {
				out.print("Number");
			} else {
				out.print("Name");
			}
			out.print("</td>");
			
			//Print out the second column
			out.print("<td>");
			if (entity.equals("PlayerData")) {
				out.print("Height");
			} else if (entity.equals("SchoolData")) {
				out.print("Rank");
			} else if (entity.equals("PlaysForF") || entity.equals("PlaysForB")) {
				out.print("Name");
			} else {
				out.print("Coach");
			}
			out.print("</td>");
			
			//Print out the third column
			out.print("<td>");
			if (entity.equals("PlayerData")) {
				out.print("Weight");
			} else if (entity.equals("SchoolData")) {
				out.print("Enrollment");
			} else if (entity.equals("PlaysForF") || entity.equals("PlaysForB")) {
				out.print("Position");
			} else {
				out.print("Coach's Pay");
			}
			out.print("</td>");
			
			//Print out the fourth column
			out.print("<td>");
			if (entity.equals("PlayerData")) {
				out.print("Class");
			} else if (entity.equals("SchoolData")) {
				out.print("Average SAT Score");
			} else if (entity.equals("PlaysForF") || entity.equals("PlaysForB")) {
				out.print("School");
			} else {
				out.print("2016 Wins");
			}
			out.print("</td>");
			
			//Print out the fifth column
			out.print("<td>");
			if (entity.equals("PlayerData")) {
				out.print("Hometown");
			} else if (entity.equals("SchoolData")) {
				out.print("Average ACT Score");
			} else if (entity.equals("PlaysForF") || entity.equals("PlaysForB")) {
				out.print("Play Time");
			} else {
				out.print("2016 Losses");
			}
			out.print("</td>");
			
			//Print out the sixth column
			if (entity.equals("PlayerData")) {
				out.print("<td>State</td>");
			} else if (entity.equals("SchoolData")) {
				out.print("<td>Acceptance Rate</td>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<td>Tackles</td>");
			} else if (entity.equals("PlaysForB")){
				out.print("<td>Rebounds</td>");
			}
			
			//Print out the seventh column
			if (entity.equals("PlayerData")) {
				out.print("<td>School</td>");
			} else if (entity.equals("SchoolData")) {
				out.print("<td>Endowment</td>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<td>Touchdowns</td>");
			} else if (entity.equals("PlaysForB")){
				out.print("<td>Assists</td>");
			}
			
			//Print out the eighth column
			if (entity.equals("PlayerData")) {
				out.print("<td>GPA</td>");
			} else if (entity.equals("SchoolData")) {
				out.print("<td>Sports Expenses</td>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<td>Field Goals</td>");
			} else if (entity.equals("PlaysForB")){
				out.print("<td>Blocks</td>");
			}
			
			//Print out the ninth column
			if (entity.equals("PlayerData")) {
				out.print("<td>Crimes Committed</td>");
			} else if (entity.equals("SchoolData")) {
				out.print("<td>Football Revenue</td>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<td>School ID</td>");
			} else if (entity.equals("PlaysForB")){
				out.print("<td>Steals</td>");
			}
			
			//Print out the tenth column
			if (entity.equals("PlayerData")) {
				out.print("<td>Injuries</td>");
			} else if (entity.equals("PlaysForF")) {
				out.print("<td>Player Status</td>");
			} else if (entity.equals("PlaysForB")){
				out.print("<td>Fouls</td>");
			}
			
			//Print out the eleventh column
			if (entity.equals("PlayerData")) {
				out.print("<td>School ID</td>");
			} else if (entity.equals("PlaysForB")){
				out.print("<td>Turnovers</td>");
			}
			
			//Print out the twelfth column
			if (entity.equals("PlayerData")) {
				out.print("<td>Major</td>");
			} else if (entity.equals("PlaysForB")){
				out.print("<td>Points</td>");
			}
			out.print("</tr>");

			//Print out the thirteenth column
			if (entity.equals("PlaysForB")) {
				out.print("<td>School ID</td>");
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
					out.print(result.getString("BCOACH PAY"));
				} else if (entity.equals("FootballTeamData")) {
					out.print(result.getString("FCOACH PAY"));
				} else {
					out.print(result.getString("POS"));
				}
				out.print("</td>");
				
				//Print out the fourth column
				out.print("<td>");
				if (entity.equals("PlayerData")) {
					out.print(result.getString("CLASS"));
				} else if (entity.equals("SchoolData")) {
					out.print(result.getString("AVG SAT"));
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
					out.print(result.getString("AVG ACT"));
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
					out.print("<td>" + result.getString("ACCEPTANCE RATE") + "</td>");
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
					out.print("<td>" + result.getString("SPORTS EXPENSES") + "</td>");
				} else if (entity.equals("PlaysForF")) {
					out.print("<td>" + result.getString("FIELD GOALS") + "</td>");
				} else if (entity.equals("PlaysForB")){
					out.print("<td>" + result.getString("BLOCKS") + "</td>");
				}
				
				//Print out the ninth column
				if (entity.equals("PlayerData")) {
					out.print("<td>" + result.getString("CRIMES") + "</td>");
				} else if (entity.equals("SchoolData")) {
					out.print("<td>" + result.getString("FOOTBALL REVENUE") + "</td>");
				} else if (entity.equals("PlaysForF")) {
					out.print("<td>" + result.getString("SCHOOLID") + "</td>");
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
					out.print("<td>" + result.getString("ID_NUM") + "</td>");
				} else if (entity.equals("PlaysForB")){
					out.print("<td>" + result.getString("TURNOVERS") + "</td>");
				}
				
				//Print out the twelfth column
				if (entity.equals("PlayerData")) {
					out.print("<td>" + result.getString("MAJOR") + "</td>");
				} else if (entity.equals("PlaysForB")){
					out.print("<td>" + result.getString("POINTS") + "</td>");
				}
				out.print("</tr>");
				
				//Print out the thirteenth column
				if (entity.equals("PlaysForB")) {
					out.print("<td>" + result.getString("ID_NUM") + "</td>");
				}

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