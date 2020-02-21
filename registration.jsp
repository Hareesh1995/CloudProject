<%@ page import="java.io.*,javax.servlet.*,javax.servlet.http.*,java.sql.*"%>


<%

		String nm=request.getParameter("name");
		String usn=request.getParameter("un");
        String pwds=request.getParameter("pwd");
        String eml=request.getParameter("email");
        String phn=request.getParameter("phn");
		String phnr=phn.substring(3).concat(phn.substring(0,4));
				
				int succ=0;
				RequestDispatcher rd;
				
		Connection con=null;
		Statement s=null;
		ResultSet rs=null;
		
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
			String sql="insert into userdet values('"+nm+"','"+usn+"','"+pwds+"','"+eml+"','"+phn+"')";
			succ=s.executeUpdate(sql);
			
			
            }
		catch(Exception e)
		{
			
		}
		
session.setAttribute("seccod",phnr);

		rd=request.getRequestDispatcher("/registered.jsp");
				rd.forward(request,response);	
		
%>