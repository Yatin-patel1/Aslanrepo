<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="emp_transactions.jsp" />
<table width="600" height="300"align=center cellspacing=0 border="0" cellpadding=0>
	<tr><td>
	<fieldset id="fieldhead">
	<legend>Work Assignment</legend><BR>
	<table align=center cellspacing=1 cellpadding=3>
	<form method=post action="performtaskupdate.jsp">
	<tr><td>
		<table width="600" height="300"align=center cellspacing=0 border="0" cellpadding=0>

		<%

			Connection con=null;
			PreparedStatement stmt=null;
			Statement st=null;
			ResultSet rs=null;
		    try{
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://enteprisevms.cnxhkbauy6wb.us-east-2.rds.amazonaws.com:3306/vms","vms","Vendor123");
				if(session.getValue("login")==null) response.sendRedirect("RMShome.htm?invalid");	
		    st=con.createStatement();
			String id=session.getValue("login").toString();
			rs=st.executeQuery("Select project_name,modulename,description,submitdate from workassign where empid='"+id+"'");
			
			while(rs.next()) {
				String project_name=rs.getString(1);
				String modname=rs.getString(2);
				String description=rs.getString(3);
				String submitdate=rs.getString(4);
						
			out.println("<table width=80% align='center' cellspacing=1 cellpadding=3><tr><td width='30%'>Project Name</td><td width='30%' style='color:gray'>"+project_name+"</td></tr><tr><td width='30%'>Assigned Task</td><td width='30%' style='color:gray'>"+modname+"</td></tr><tr><td width='30%'>Description</td><td width='30%' style='color:gray'>"+description+"</td></tr><tr><td width='30%'>Submit Date</td><td width='30%' style='color:gray'>"+submitdate+"</td></tr><tr><td width='30%'>Task Perforrmed</td><td><textarea name=taskperform cols=40 rows=10></textarea></td></tr><tr><td width='30%'>Status</td><td width='30%' style='color:gray'><select name=status><option>      </option> <option>Not Yet</option> <option>Completed</option></select></td></tr></table>");
				
				}
		}catch(Exception e){e.printStackTrace();}

		%>
		<tr><Td colspan=2 align=center><button type=submit accesskey="S"><u>S</u>ubmit Task</button>
							&nbsp;&nbsp;<button type=reset accesskey="R"><u>R</u>eset</button>
		</td></tr>
	</table></form>
	</fieldset>
	</td></tr></table>

</body>
</html>