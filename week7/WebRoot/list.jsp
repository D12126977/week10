<%@page import="java.sql.*" pageEncoding="gbk"%>
请输入查询关键字：
<form action="list.jsp" method="get">
	<input type="text" name="keyword"/>
	<input type="submit" value="查询"/>
</form>
<table border=1>
	<tr>
		<th>用户编号</th>
		<th>用户名</th>
		<th>密码</th>
		<th colspan='2'>操作</th>				
	</tr>
<%
	//显示数据库中所有的数据
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","root");
		String keyword=request.getParameter("keyword");
		String sql="";
		PreparedStatement pstm;
		if("".equals(keyword))
		{
			sql="select * from user";
			pstm=con.prepareStatement(sql);//查询user表中全部数据
		}
		else
		{
			sql="select * from user where name like '%"+keyword+"%'";
			pstm=con.prepareStatement(sql);//查询user表中全部数据
		}		
		ResultSet rs=pstm.executeQuery();//执行查询
		while(rs.next())
		{
		String i=rs.getString(1);
%>
			<tr>
				<td><%=i%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><a href="modify-users.jsp?id=<%=i%>">编辑</a></td>
				<td><a href="delete.jsp">删除</a></td>
			</tr>
<%
			
		}
	}catch(Exception e)
	{
		e.printStackTrace();	
	}
%>
</table>