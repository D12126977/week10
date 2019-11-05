<%@page import="java.sql.*" pageEncoding="gbk"%>
<%
	String id=request.getParameter("id");
	int i=Integer.parseInt(id);
	String name=request.getParameter("name");
	String password=request.getParameter("password");
	try{
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","root");
			PreparedStatement pstm=con.prepareStatement("update user set name=?,password=? where id=?");//²éÑ¯
			pstm.setString(1,name);
			pstm.setString(2,password);
			pstm.setInt(3,i);
			pstm.executeUpdate();
			pstm.close();
			con.close();
		}catch(Exception e)
		{
			e.printStackTrace();	
		}
%>
<jsp:forward page="list.jsp"></jsp:forward>