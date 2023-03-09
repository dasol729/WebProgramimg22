<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="p3.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="lectureM" class="p3.LectureManager" scope="application" />
<jsp:useBean id="lectureB" class="p3.LectureBean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	table {  
		border-collapse: collapse;                              
	}
	table, td, th, tr{
		border: 1px solid #000000;
		text-align:center;
	}
	td{
		width:100px;            
	}
	#table_title {
		text-align: center;
		font-size:20px;
		font-weight: bold;
    }
    #day{
		height: 60px;            
		font-size:20px;
		font-weight: bold;
    }
	#class1{
		text-align: center;
		font-size: 13px;
		background-color: #FFE08C;
	}
	#class2{
		text-align: center;
		font-size: 13px;
		background-color: #B2CCFF;
	}
	#class3{
		text-align: center;
		font-size: 13px;
		background-color: #BDBDBD;
	}
	#class4{
		text-align: center;
		font-size: 13px;
	}
</style>
<title>강의 시간표</title>
</head>
<body>
<%
String[] typeNames = {"전공필수", "전공선택", "교양", "자유선택"};
String[] titleNames = {"웹프로그래밍", "운영체제", "소프트웨어프로그래밍", "데이터베이스개론",
	"자료구조", "네트워크", "창의와감성", "사회봉사" };
String[] dayNames = {"월", "화", "수", "목", "금"};

lectureM.buildMatrix();
int[][] lectureType = lectureM.getTypeMatrix();
int[][] consecutive = lectureM.getSpanMatrix();
int[][] lectureTitle = lectureM.getTitleMatrix();
%>
<p id="table_title" align="center">강의 시간표</p>
<table height="480px"> <!--테이블 생성-->   
	<tr id="day">
		<th>2학년</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th>
	</tr>       
<% 	for(int i = 0; i < lectureM.getTimes(); i++){ 
		out.println("<tr>");
		for(int j = -1; j < lectureM.getDays(); j++){
			if (j==-1){
				out.println("<td id=day>" + (i+1) + "</td>");
				continue;
			}				
			if(lectureType[i][j] == 1){
				out.println("<td id=class1 rowspan=" + consecutive[i][j] + ">"
							+ titleNames[lectureTitle[i][j]] + "</td>");
			}
			else if(lectureType[i][j] == 2){
				out.println("<td id=class2 rowspan=" + consecutive[i][j] + ">"
						+ titleNames[lectureTitle[i][j]] + "</td>");
			}
			else if(lectureType[i][j] == 3){
				out.println("<td id=class3 rowspan=" + consecutive[i][j] + ">"
						+ titleNames[lectureTitle[i][j]] + "</td>");
			}
			else if(lectureType[i][j] == 4){
				out.println("<td id=class4 rowspan=" + consecutive[i][j] + ">"
						+ titleNames[lectureTitle[i][j]] + "</td>");
			}
			else {
				if(consecutive[i][j]!=0) //rowspan 아래에는 <td></td>쓰면 한 열 추가됨
					out.println("<td></td>"); 
			}
		}
		out.println("</tr>");
	}
%>
</table>
</body>
</html>