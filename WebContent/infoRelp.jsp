<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<body>
<%
	String email=(String)session.getAttribute("email");
	session.setAttribute("email",email);
	
%>
		
<%
String status;

	try
	{
		String currentUser=(String)session.getAttribute("email");
		session.setAttribute("email",currentUser);
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
		
			PreparedStatement ps=conn.prepareStatement("select status,email from relation where email=?");
		ps.setString(1,currentUser);
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			status=rs.getString(1);
			
			if(status!=null)
			{
				out.println("<h4>Relationship Status </h4>"+" &nbsp "+status+"<hr>");
			}
			else
			{
				out.println("<h4>Relationship Status</h4>"+"&nbsp &nbsp "+"<span style='color:green'>Not Assigned</span>"+"<hr>");
			}
			
			
 		}
	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		



	%>	
	
	</body>

</html>