<%@page import="java.sql.*" pageEncoding="gbk"%>
�������ѯ�ؼ��֣�
<form action="list.jsp" method="get">
	<input type="text" name="keyword"/>
	<input type="submit" value="��ѯ"/>
</form>
<table border=1>
	<tr>
		<th>�û����</th>
		<th>�û���</th>
		<th>����</th>
		<th colspan='2'>����</th>				
	</tr>
<%
	//��ʾ���ݿ������е�����
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","root");
		String keyword=request.getParameter("keyword");
		String sql="";
		PreparedStatement pstm;
		if("".equals(keyword))
		{
			sql="select * from user";
			pstm=con.prepareStatement(sql);//��ѯuser����ȫ������
		}
		else
		{
			sql="select * from user where name like '%"+keyword+"%'";
			pstm=con.prepareStatement(sql);//��ѯuser����ȫ������
		}		
		ResultSet rs=pstm.executeQuery();//ִ�в�ѯ
		while(rs.next())
		{
		String i=rs.getString(1);
%>
			<tr>
				<td><%=i%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><a href="modify-users.jsp?id=<%=i%>">�༭</a></td>
				<td><a href="delete.jsp">ɾ��</a></td>
			</tr>
<%
			
		}
	}catch(Exception e)
	{
		e.printStackTrace();	
	}
%>
</table>