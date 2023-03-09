<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="currentPage" %>
<%@ attribute name="rpp1" %>
<%@ attribute name="kind" %>
<jsp:useBean id="am" class="p1.AddrManager" scope="application"/>
<%	
	int rpp = Integer.parseInt(rpp1); 
	int allpage = am.getAddrList().size(); 
	int startIndex = 1;
	int lastIndex = (allpage%rpp == 0? allpage/rpp : allpage/rpp+1);
 
	for(int i=startIndex; i <= lastIndex; i++){ 
		if(i==Integer.parseInt(currentPage))
			out.print(i);
		else{
			if(kind.equals("list"))
				out.print("<a href=addr_list.jsp?sindex=" + i + ">" + i + "</a>");
			else
				out.print("<a href=addr_list_group.jsp?sindex=" + i + ">" + i + "</a>");
		}
			
		if(i < lastIndex)
			out.print("|");
	}
%>