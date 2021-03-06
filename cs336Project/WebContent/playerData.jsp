<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Player Data</title>
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
		List<String> list = new ArrayList<String>();
	
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			String[] attributes = {"name", "sport", "university", "gpa", "hometown", "major", "crimes"};
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String query = "SELECT p.* FROM cs336project.PlayerData p WHERE ";
			for (int i = 0; i < attributes.length; i++) {
				//Get the combobox from the index.jsp
				String entity = request.getParameter(attributes[i]);
				//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
				String str = "";
				switch (i) {
					case 0: if (!entity.equals(""))
								str = "p.NAME LIKE \"%" + entity + "%\" AND ";
					break;
					case 1: if (entity.equals("football")) {
								query = query.replace("PlayerData p", "PlayerData p, cs336project.PlaysForF f");
								str = "p.ID_NUM = f.ID_NUM AND p.SCHOOL = f.SCHOOL AND ";
							} else if (entity.equals("basketball")) {
								query = query.replace("PlayerData p", "PlayerData p, cs336project.PlaysForB b");
								str = "p.ID_NUM = b.ID_NUM AND p.SCHOOL = b.SCHOOL AND ";
							}
					break;
					case 2: if (!entity.equals("All"))
								str = "p.SCHOOL = \"" + entity + "\" AND ";
					break;
					case 3: if (!entity.equals(""))
								try {
									Double.parseDouble(entity);
									str = "p.GPA >= " + entity + " AND ";
								} catch (Exception e) {
									out.print("<script>window.alert(\"Invalid number entered for GPA. Not selecting for GPA.\");</script>");
								}
								
					break;
					case 4: if (!entity.equals(""))
								str = "p.HOMETOWN LIKE \"%" + entity + "%\" AND ";
					break;
					case 5: if (!entity.equals("All Majors"))
								str = "p.MAJOR = \"" + entity + "\" AND ";
					break;
					case 6: if (!entity.equals(""))
								try {
									Integer.parseInt(entity);
									str = "p.CRIMES >= " + entity;
								} catch (Exception e) {
									out.print("<script>window.alert(\"Invalid number entered for crimes committed. Not selecting for crime number.\");</script>");
								}
								
					break;
					default: break;
				}
				//Run the query against the database.
				query += str;
				System.out.println(query);
			}
			if (query.substring(query.length() - 5).equals(" AND "))
				query = query.substring(0, query.length() - 5);
			if (query.substring(query.length() - 7).equals(" WHERE "))
				query = query.substring(0, query.length() - 7);
			System.out.println(query);
			ResultSet result = stmt.executeQuery(query);
			System.out.println("Successfully queried");
			
			//Make an HTML table to show the results in:
			out.print("<table id=\"data\">");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<th>Name</th>");
			//make a column
			out.print("<th>Height</th>");
			//make a column
			out.print("<th>Weight</th>");
			//make a column
			out.print("<th>Class</th>");
			//make a column
			out.print("<th>Hometown</th>");
			//make a column
			out.print("<th>State</th>");
			//make a column
			out.print("<th>School</th>");
			//make a column
			out.print("<th>GPA</th>");
			//make a column
			out.print("<th>Crimes Committed</th>");
			//make a column
			out.print("<th>Injuries</th>");
			//make a column
			out.print("<th>School ID</th>");
			//make a column
			out.print("<th>Major</th>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>" + result.getString("NAME") + "</td>");
				//make a column
				out.print("<td>" + result.getString("HT") + "</td>");
				//make a column
				out.print("<td>" + result.getString("WT") + "</td>");
				//make a column
				out.print("<td>" + result.getString("CLASS") + "</td>");
				//make a column
				out.print("<td>" + result.getString("HOMETOWN") + "</td>");
				//make a column
				out.print("<td>" + result.getString("STATE") + "</td>");
				//make a column
				out.print("<td>" + result.getString("SCHOOL") + "</td>");
				//make a column
				out.print("<td>" + result.getString("GPA") + "</td>");
				//make a column
				out.print("<td>" + result.getString("CRIMES") + "</td>");
				//make a column
				out.print("<td>" + result.getString("INJURIES") + "</td>");
				//make a column
				out.print("<td>" + result.getString("ID_NUM") + "</td>");
				//make a column
				out.print("<td>" + result.getString("MAJOR") + "</td>");
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>