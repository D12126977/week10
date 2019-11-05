<%@page import="java.sql.*" pageEncoding="gbk"%>
<%
	String id=request.getParameter("id");
	if("".equals(id))
	{}
	else{
		//删除数据库中所有的数据
		try{
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","root");
			PreparedStatement pstm=con.prepareStatement("select * from user where id=?");//查询
			pstm.setString(1,id);
			ResultSet rs=pstm.executeQuery();
			if(rs.next())
			{
%>
				<form action="modify-do.jsp" method="post">
					id:<input type="text" name="id" value=<%=rs.getString(1)%>><br/>
					name:<input type="text" name="name" value=<%=rs.getString(2)%>><br/>
					password:<input type="text" name="password" value=<%=rs.getString(3)%>><br/>
					<input type="submit" value="修改"/>
				</form>
<%				
			}
			rs.close();
			pstm.close();
			con.close();
		}catch(Exception e)
		{
			e.printStackTrace();	
		}
	}
%>