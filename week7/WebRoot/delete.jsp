<%@page import="java.sql.*" pageEncoding="gbk"%>
<form action="delete.jsp" method="post">
	<input type="text" name="id"/><br/>
	<input type="submit" value="提交"/>
</form>
<%
	String id=request.getParameter("id");
	if("".equals(id))
	{}
	else{
		//删除数据库中所有的数据
		try{
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","root");
			PreparedStatement pstm=con.prepareStatement("delete from user where id=?");//删除
			pstm.setString(1,id);
			pstm.executeUpdate();
			pstm.close();
			con.close();
		}catch(Exception e)
		{
			e.printStackTrace();	
		}
	}
%>