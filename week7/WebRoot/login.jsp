<%@page import="java.sql.*" pageEncoding="gbk"%>
<%//��¼��֤
	String id=request.getParameter("id");
	String password=request.getParameter("upass");
	if("".equals(id)||"".equals(password))
	{
		//out.println("�û��������벻��Ϊ��");
	
%>
		<jsp:forward page="loginl.html"/>
<%
	}
	else{
	//���ݿ����
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","root");
		PreparedStatement pstm=con.prepareStatement("select * from user where id=? and password=?");
		pstm.setString(1,id);//���ò���
		pstm.setString(2,password);
		ResultSet rs=pstm.executeQuery();//ִ�����ݿ��ѯ����
		if(rs.next())//�����ѯ�����Ϊ��
		{
			out.println("��¼�ɹ�");	
		}
		else
		{
			out.println("��¼ʧ��");
		}
		pstm.close();
		con.close();
	}catch(Exception e)
	{
		e.printStackTrace();
	}
	}
%>