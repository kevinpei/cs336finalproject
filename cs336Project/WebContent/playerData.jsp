<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			String[] attributes = {"name", "sport", "university", "gpa", "hometown"};
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String query = "SELECT * FROM PlayerData p, PlaysForB b, PlaysForF f WHERE ";
			for (int i = 0; i < attributes.length; i++) {
				//Get the combobox from the index.jsp
				String entity = request.getParameter(attributes[i]);
				//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
				String str = "";
				switch (i) {
					case 0: if (!entity.equals(""))
								str = "p.NAME = %" + entity + "% AND ";
					break;
					case 1: if (entity.equals("football")) 
								str = "p.ID_NUM = f.ID_NUM AND p.SCHOOL = f.SCHOOL AND ";
							else if (entity.equals("basketball"))
								str = "p.ID_NUM = b.ID_NUM AND p.SCHOOL = b.SCHOOL AND ";
					break;
					case 2: if (!entity.equals("All"))
								str = "p.SCHOOL = %" + entity + "% AND ";
					break;
					case 3: if (!entity.equals(""))
								str = "p.GPA >= " + entity + " AND ";
					break;
					case 4: if (!entity.equals(""))
								str = "p.HOMETOWN = %" + entity + "%";
					break;
					default: break;
				}
				//Run the query against the database.
				query += str;
				System.out.println(query);
			}
			if (query.substring(query.length() - 5).equals(" AND "))
				query = query.substring(0, query.length() - 5);
			System.out.println(query);
			ResultSet result = stmt.executeQuery(query);
			System.out.println("Successfully queried");
			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>Name</td>");
			//make a column
			out.print("<td>Height</td>");
			//make a column
			out.print("<td>Weight</td>");
			//make a column
			out.print("<td>Class</td>");
			//make a column
			out.print("<td>Hometown</td>");
			//make a column
			out.print("<td>State</td>");
			//make a column
			out.print("<td>School</td>");
			//make a column
			out.print("<td>GPA</td>");
			//make a column
			out.print("<td>Crimes Committed</td>");
			//make a column
			out.print("<td>Injuries</td>");
			//make a column
			out.print("<td>School ID</td>");
			//make a column
			out.print("<td>Major</td>");
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