<%@page import="java.sql.*" pageEncoding="gbk"%>
<%
	//接收用户提交过来的数据id,upass
	String id=request.getParameter("id");
	String password=request.getParameter("upass");
	//把数据添加到数据库中
	try{
		Class.forName("org.gjt.mm.mysql.Driver");//1.加载驱动
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","root");//2.建立连接
		PreparedStatement pstm=con.prepareStatement("insert into user(name,password) values(?,?)");//3.创建语句对象
		pstm.setString(1,id);//4.设置参数
		pstm.setString(2,password);
		pstm.executeUpdate();//5.执行命令
		//6.处理结果（查询）
		pstm.close();//7.断开所有链接
		con.close();
	}catch(Exception e)
	{
		e.printStackTrace();
	}
%>