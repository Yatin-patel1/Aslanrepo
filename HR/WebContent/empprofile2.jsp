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
<p><b>Personal Profile</font><hr color="#008000" size="4">

<%

	Connection con=null;
	PreparedStatement stmt=null;
	Statement st=null;
	ResultSet rs=null;
    try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://enteprisevms.cnxhkbauy6wb.us-east-2.rds.amazonaws.com:3306/vms","vms","Vendor123");
		if(session.getValue("login")==null) response.sendRedirect("Emall.htm?invalid");	
    st=con.createStatement();
	String user=session.getValue("login").toString();
	rs=st.executeQuery("Select user_id,user_name,alternate_email,date_of_birth,address,occuption from userinfo where user_id='"+user+"'");
	
	while(rs.next()) {
		String userid=rs.getString(1);
		String username=rs.getString(2);
		String aemail=rs.getString(3);
		String adreess=rs.getString(4);
		String occuption=rs.getString(5);
		String dob=rs.getString(6);
		
	String buff="<table width=80% align=center cellspacing=1 cellpadding=3><tr><td width='10%' style='color:aliceblue'>UserID</td><TD>"+userid+"</td></tr><tr><td><input type=textbox  value='"+username+"'>"+username+"</td></tr><tr><Td><input type=testbox  name=aemail value='"+aemail+"'>"+aemail+"</td></tr><tr><TD><input type=textbox  name=adreess value='"+adreess+"'>"+adreess+"</td></tr><tr><td><input type=textbox name=occuption value='"+occuption+"'>"+occuption+"</td></tr><tr><td><input type=textbox name=total value='"+dob+"'>"+ dob+"</td></tr></table>";
		
		}
}catch(Exception e){e.printStackTrace();}

%>

</body>
</html>