<%@page import="java.sql.*" pageEncoding="gbk"%>
<%//登录验证
	String id=request.getParameter("id");
	String password=request.getParameter("upass");
	if("".equals(id)||"".equals(password))
	{
		//out.println("用户名和密码不能为空");
	
%>
		<jsp:forward page="loginl.html"/>
<%
	}
	else{
	//数据库操作
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","root");
		PreparedStatement pstm=con.prepareStatement("select * from user where id=? and password=?");
		pstm.setString(1,id);//设置参数
		pstm.setString(2,password);
		ResultSet rs=pstm.executeQuery();//执行数据库查询操作
		if(rs.next())//如果查询结果不为空
		{
			out.println("登录成功");	
		}
		else
		{
			out.println("登录失败");
		}
		pstm.close();
		con.close();
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	}
%>