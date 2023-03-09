<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="p1.*"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="addr" class="p1.AddrBean"/> 
<jsp:setProperty name="addr" property="*"/> 
<jsp:useBean id="am" class="p1.AddrManager" scope="application"/>
<% am.add(addr);%>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 등록 결과</title>
</head>
<div align=center>
<h2>등록내용</h2>
이름 : ${addr.username}<p>
전화번호 : ${addr.tel}<p>
이메일 : ${addr.email}<p>
성별 : ${addr.gender}<p>
그룹 : ${addr.group}<p>
<hr>
<a href="addr_list.jsp">전체 목록보기</a>
<a href="addr_list_group.jsp">그룹별 목록보기</a>
</div>
</body>
</html>