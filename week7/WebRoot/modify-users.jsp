<%@page import="java.sql.*" pageEncoding="gbk"%>
<%
	String id=request.getParameter("id");
	if("".equals(id))
	{}
	else{
		//ɾ�����ݿ������е�����
		try{
			Class.forName("org.gjt.mm.mysql.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","root");
			PreparedStatement pstm=con.prepareStatement("select * from user where id=?");//��ѯ
			pstm.setString(1,id);
			ResultSet rs=pstm.executeQuery();
			if(rs.next())
			{
%>
				<form action="modify-do.jsp" method="post">
					id:<input type="text" name="id" value=<%=rs.getString(1)%>><br/>
					name:<input type="text" name="name" value=<%=rs.getString(2)%>><br/>
					password:<input type="text" name="password" value=<%=rs.getString(3)%>><br/>
					<input type="submit" value="�޸�"/>
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