<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="p1.*"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="listIndextag"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<jsp:useBean id="am" class="p1.AddrManager" scope="application"/> 
<html>
<head>
<meta charset="UTF-8">
<title>addr_list_group</title>
</head>
<body>
<div align=center>
<h2>주소록(그룹보기)</h2>
<hr> 
<a href="addr_form.jsp">주소추가</a><p>
<table border=1 width=500>
<tr><td>이름</td><td>전화번호</td><td>이메일</td><td>성별</td><td>그룹</td></tr>
<%
	int rpp = 2; 
	int currentPage = 1; 
	int allpage = am.getAddrList().size(); 
	int startIndex = 1;
	int lastIndex = (allpage%rpp == 0? allpage/rpp : allpage/rpp+1); 
	String str = request.getParameter("sindex"); 
	
	if (str != null)
		currentPage = Integer.parseInt(str);	
	int nextPage = currentPage + 1;
	request.setAttribute("rpp", rpp); 
	request.setAttribute("sindex", nextPage); 
%>
<% 
int num = 0;
int cnt = 0;
for(AddrBean ab : am.sortList()) { 	
	if(num < rpp*(currentPage-1)){
		num++;
		continue;
	}
	cnt++;
	if(cnt > rpp)
		break;	
%>
	<tr><td><%=ab.getUsername() %></td>
	<td><%=ab.getTel() %></td>
	<td><%=ab.getEmail() %></td>
	<td><%=ab.getGender() %></td>
	<td><%=ab.getGroup() %></td></tr>
<% } %>			
</table>
<listIndextag:addrListIndex currentPage="${sindex-1}" rpp1="${rpp}" kind="list_group"/>
</div>
<br><a href=mainIndex.jsp align=left>mainIndex</a>
</body>
</html>