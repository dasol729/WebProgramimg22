<!-- 추가기능 : 같은 시간에 등록된 강의 (전에 등록한 것 삭제) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="p3.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<jsp:useBean id="lectureM" class="p3.LectureManager" scope="application" />
<jsp:useBean id="lectureB" class="p3.LectureBean"/>
<jsp:setProperty name="lectureB" property="*" />
<% if(lectureB.getType() != -1) {
		lectureM.lectureCheck(lectureB); 
		lectureM.add(lectureB); 
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>lecture main</title>
</head>
<body>
<form method=post action="lecture.jsp">
	과목타입 : <select name="type">
				<option value="0" selected>전공필수
				<option value="1">전공선택
				<option value="2">교양
				<option value="3">자유선택
				</option>
			</select>
	과목명 : <select name="title">
				<option value="0" selected>웹프로그래밍
				<option value="1">운영체제
				<option value="2">소프트웨어프로그래밍
				<option value="3">데이터베이스개론
				<option value="4">자료구조
				<option value="5">네트워크
				<option value="6">창의와감성
				<option value="7">사회봉사
				</option>
			</select>
	요일 : <select name="day">
				<option value="0" selected>월
				<option value="1">화
				<option value="2">수
				<option value="3">목
				<option value="4">금
				</option>
			</select>
	시간 : <select name="time">
				<option value="0" selected>1
				<option value="1">2
				<option value="2">3
				<option value="3">4
				<option value="4">5
				<option value="5">6
				</option>
			</select>
	연강여부 : <select name="consecutive">
			<option value="1" selected>1
			<option value="2">2
			<option value="3">3
			<option value="4">4
			<option value="5">5
			<option value="6">6
			</option>
		</select>
<input type="submit" value="등록">
</form>
<hr>
<div align=center>
<jsp:include page="lecture_table.jsp"/>
</div>
<br>
<hr>
<p align=center>
<c:if test="${lectureM.lectureList != null}">
	<c:forEach var="n" items="${lectureM.lectureList}">
		${n.toString()}<br>
	</c:forEach>
</c:if> 
</p>
</body>
</html>