<%@page import="java.sql.*" pageEncoding="gbk"%>
<%
	//�����û��ύ����������id,upass
	String id=request.getParameter("id");
	String password=request.getParameter("upass");
	//��������ӵ����ݿ���
	try{
		Class.forName("org.gjt.mm.mysql.Driver");//1.��������
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","root");//2.��������
		PreparedStatement pstm=con.prepareStatement("insert into user(name,password) values(?,?)");//3.����������
		pstm.setString(1,id);//4.���ò���
		pstm.setString(2,password);
		pstm.executeUpdate();//5.ִ������
		//6.����������ѯ��
		pstm.close();//7.�Ͽ���������
		con.close();
	}catch(Exception e)
	{
		e.printStackTrace();
	}
%>