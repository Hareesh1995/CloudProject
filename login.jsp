<%@ page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*"%>

<%

		String user=request.getParameter("user");
		
		String ps=request.getParameter("pass");
				
		Connection con=null;
		Statement s=null;
		ResultSet rs=null;
		
		RequestDispatcher rd;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");	
		}
		catch(ClassNotFoundException ce)
		{
		}
		try{
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","1234");
			s=con.createStatement();
			String sql="select * from userdet where username='"+user+"' and password='"+ps+"'";
			rs=s.executeQuery(sql);
			
			if(!rs.next())
			{
				rd=request.getRequestDispatcher("/index.html");
				rd.forward(request,response);
			}
			else
			{
				rd=request.getRequestDispatcher("/upverify.jsp");
				rd.forward(request,response);
			}
				
				
		}
		catch(Exception e)
		{
			
		}
			
		
%>