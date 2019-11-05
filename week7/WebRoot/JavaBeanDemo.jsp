<%@page contentType="text/html" pageEncoding="gbk"%>
<jsp:useBean id="user" class="cn.bgd.cs.se.lgj.User" scope="page"/>
<jsp:setProperty name="user" property="*"/>
<%=user.getId()%>
<%=user.getName()%>
<%=user.getPassword()%>