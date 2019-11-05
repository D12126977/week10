<%@page contentType="text/html;charset=gbk" pageEncoding="gbk"%>
<%
	request.setCharacterEncoding("gbk");
 %>
<jsp:useBean id="user" class="cn.bgd.cs.se.lgj.User" scope="application"/>
<jsp:setProperty property="*" name="user"/>
<!--
<jsp:setProperty name="user" property="id" param="password"/> 
 -->
<jsp:forward page="JavaBeanDemo.jsp"></jsp:forward>