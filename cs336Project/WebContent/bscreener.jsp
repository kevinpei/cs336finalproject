<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
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
		String ent0 = request.getParameter("Position"); //A,C,F,G
		String ent1 = request.getParameter("weight"); //150 to 290
		String ent2 = request.getParameter("height"); //70 to 87
		String ent3 = request.getParameter("gpa");  //2 to 4 by .5 increments
		
		//weight table
		String val = null;
		if (ent1.equals("150")){ val = "160"; 
		} else if(ent1.equals("160")){ val = "170";
		} else if(ent1.equals("170")){ val = "180";
		} else if(ent1.equals("180")){ val = "190";
		} else if(ent1.equals("190")){ val = "200";
		} else if(ent1.equals("200")){ val = "210";
		} else if(ent1.equals("210")){ val = "220";
		} else if(ent1.equals("220")){ val = "230";
		} else if(ent1.equals("230")){ val = "240";
		} else if(ent1.equals("240")){ val = "250";
		} else if(ent1.equals("250")){ val = "260";
		} else if(ent1.equals("260")){ val = "270";
		} else if(ent1.equals("270")){ val = "280";
		} else if(ent1.equals("280")){ val = "290";
		} else if(ent1.equals("290")){ val = "300";
		} else { //nothing
		} //end 
		
		
		//gpa table
		String lowbound = null;
		if (ent3.equals("2")){ lowbound = "0"; 
		} else if(ent3.equals("2.5")){ lowbound = "2";
		} else if(ent3.equals("3")){   lowbound = "2.5";
		} else if(ent3.equals("3.5")){ lowbound = "3";
		} else if(ent3.equals("4")){   lowbound = "3.5";
		} else { //nothing
		} //end 
		
		String str = "SELECT a.NAME, a.SCHOOL, b.HT, b.WT, b.GPA FROM cs336project.PlaysForB a, cs336project.PlayerData b WHERE a.ID_NUM = b.ID_NUM AND a.POS = \"" + ent0 + "\" AND b.WT > \"" + ent1 + "\" AND b.WT < \"" + val + "\" AND b.HT = \"" + ent2 + "\" AND b.GPA > \"" + lowbound + "\" AND b.GPA < \"" + ent3 + "\"";

		//Run the query against the database.
		ResultSet result = stmt.executeQuery(str);
		
		if (!result.isBeforeFirst() ) {    
		    System.out.println("No data"); 
		
			str = "SELECT a.NAME, a.SCHOOL, b.HT, b.WT, b.GPA FROM cs336project.PlaysForB a, cs336project.PlayerData b WHERE a.ID_NUM = b.ID_NUM AND a.POS = \"" + ent0 + "\" AND b.WT > \"" + ent1 + "\" AND b.WT < \"" + val + "\" AND b.HT = \"" + ent2 + "\" ";
			result = stmt.executeQuery(str);
		}
		
		if (!result.isBeforeFirst() ) {    
		    System.out.println("No data1"); 
		
			str = "SELECT a.NAME, a.SCHOOL, b.HT, b.WT, b.GPA FROM cs336project.PlaysForB a, cs336project.PlayerData b WHERE a.ID_NUM = b.ID_NUM AND a.POS = \"" + ent0 + "\" AND b.HT = \"" + ent2 + "\" ";
			result = stmt.executeQuery(str);
		}
		
		if (!result.isBeforeFirst() ) {    
		    System.out.println("No data2"); 
		
			str = "SELECT a.NAME, a.SCHOOL, b.HT, b.WT, b.GPA FROM cs336project.PlaysForB a, cs336project.PlayerData b WHERE a.ID_NUM = b.ID_NUM AND a.POS = \"" + ent0 + "\" ";
			result = stmt.executeQuery(str);
		}
		
		//Make an HTML table to show the results in:
		out.print("<table id=\"data\">");
		
		//make a row
		out.print("<tr>");
		//make a column 1
		out.print("<th>NAME</th>");
		//make a column 2
		out.print("<th>UNIVERSITY</th>");
		//make a column 3
		out.print("<th>HEIGHT (in.)</th>");
		//make a column 4
		out.print("<th>WEIGHT (lbs.)</th>");
		//make a column 5
		out.print("<th>GPA</th>");
		out.print("</tr>");

		//parse out the results
		while (result.next()) {
		
			//make a row
			out.print("<tr>");
			
			//make a column 1
			out.print("<td>" + result.getString("a.NAME") + "</td>");
			
			//make a column 2
			out.print("<td>" + result.getString("a.SCHOOL") + "</td>");
			
			//make a column 3
			out.print("<td>" + result.getString("b.HT") + "</td>");
			
			//make a column 4
			out.print("<td>" + result.getString("b.WT") + "</td>");
			
			//make a column 5
			out.print("<td>" + result.getString("b.GPA") + "</td>");
			
			out.print("</tr>");
			
		} //end while loop


		//close the connection.
		con.close();
				
	} catch (Exception e) {
		out.print(e);
	}		




%>
</body>
</html>