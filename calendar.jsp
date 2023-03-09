<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%!
	public String parseDay (int cnt, String day){	
		String str = day;
		if (cnt % 7 == 0)
			str = "<font color=\"red\">" + day + "</font>";
		else if (cnt % 7 == 6)
			str = "<font color=\"blue\">" + day + "</font>";		
		return str;
	}    

	Calendar today = Calendar.getInstance(); // 오늘의 날짜를 저장하고 있는 객체 추가
	int nowYear = today.get(Calendar.YEAR);
	int nowMonth = today.get(Calendar.MONTH) + 1;
	int nowDate = today.get(Calendar.DATE);	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>project2</title>
<style>
#line {
	border:2px solid black;
	border-collapse:collapse;
	text-align:center;
}
</style>
</head>
<body>
<%
	Calendar calendar = Calendar.getInstance(); // 달력을 만드는 객체 추가
	
	String sYear = request.getParameter("YEAR");
	int year = calendar.get(Calendar.YEAR);
	if (sYear != null)
		year = Integer.parseInt(sYear); 
	
	String sMonth = request.getParameter("MONTH");
	int month = calendar.get(Calendar.MONTH) + 1;
	if (sMonth != null)
		month = Integer.parseInt(sMonth); 
	
	calendar.set(year, month-1, 1);			// 만들 달력의 년월 세팅
		
	int date = calendar.get(Calendar.DATE); // YEAR과 MONTH에 맞게 변화
	String[] days = {"일", "월", "화", "수", "목", "금", "토"};
	
	int day = calendar.get(Calendar.DAY_OF_WEEK);
	int start = calendar.getMinimum(Calendar.DATE);
	int end = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	int end_i = 42;
	if (day == 1 && end == 28)
		end_i = 35;
	else if (day + end - 1 > 35)
		end_i = 49;
%>
<%	
out.println("<h4><div align=center>");
out.println("<a href=calendar.jsp?YEAR=" + (year-1) + "&MONTH=" + month + ">◀</a>");
out.println(year + "년");
out.println("<a href=calendar.jsp?YEAR=" + (year+1) + "&MONTH=" + month + ">▶</a>");
%>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
<%
if(month > 1)
	out.println("<a href=calendar.jsp?YEAR=" + year + "&MONTH=" + (month-1) + ">◀</a>");	
else
	out.println("◀");
out.println(month + "월");
if(month < 12)
	out.println("<a href=calendar.jsp?YEAR=" + year + "&MONTH=" + (month+1) + ">▶</a>");	
else
	out.println("▶");
%>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
<%

out.println("<span>" + nowYear + "-" + nowMonth + "-" + nowDate + "</span>");
out.println("</div></h4>");
out.println("<div align=center>");
out.println("<table id=line width = 700 height = 300>");
for(int cnt = 0; cnt < end_i; cnt++){
	if(cnt % 7 == 0)
		out.println("<tr id=line>");
	if (cnt < 7)
		out.println("<td id=line align=center><b>" + parseDay(cnt, days[cnt]) + "</b></td>");
	else{
		if(cnt < day+6 || start > end)
			out.println("<td id=line>&nbsp</td>");
		else{
			out.println("<td id=line align=center>" + parseDay(cnt, Integer.toString(start)) + "</td>");
			start++;
		}
	}	
	if(cnt % 7 == 6)
		out.println("</tr>");
}
out.println("</table>");
out.println("</div>");
%>
<br><a href=mainIndex.jsp>mainIndex</a>
</body>
</html>