<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%@include file="common.jsp"%>
</head>
<body>
<%
String url = "jdbc:oracle:thin:@localhost:1521/ORCL"; 
String id = "csuser"; // 사용자계정 
String pw = "cs1234"; // 사용자계정의 패스워드 // 데이터베이스와 연동하기 위해 DriverManager에 등록한다. 
Connection con = null;
PreparedStatement ps =null;
Statement  stmt   = null;
ResultSet rs = null;
String name=(String)application.getAttribute("name");
String ID = "'"+name+"'";
String sql1="select id, sum(quantity*bottle.point) as 총포인트 from waste,bottle where emittype in (select bottle from bottle) and waste.emittype=bottle.bottle and emitdate like '___05%' group by id order by sum(quantity*bottle.point) desc";

int i=1;
try
 {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection(url, id, pw);
    System.out.println("연결확인");
    
    ps=con.prepareStatement(sql1);
    rs = ps.executeQuery();
   
    %>
  <%@include file="nav.jsp"%>
        
   <div class="container">
   <br>
   <br>
   <br>
<h2 >이번달의 에코왕</h2>
      <div class="row">
        <table class="table table-hover">
      <thead>
      <tr><th>순위</th><th>ID</th><th>총포인트</th><th>등급</th></tr>
      </thead>
      <tbody>
     
    <% 
    String level;
    while(rs.next()){
    	if(rs.getInt(2)>=300){
    		level="Gold";
    	}
    	else if(rs.getInt(2)<300&&rs.getInt(2)>=200){
    		level="Silver";
    	}
    	else {
    		level="Bronze";
    	}
    	if(name.equals(rs.getString(1))){%>
    		 <tr bgcolor=#FBDDF6><td><%=i %></td><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=level %></td></tr>
    	<% }
    	else {
    	%>
    	 <tr><td><%=i %></td><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=level %></td></tr>
    	<%} i++;}%>
      <%  }catch(SQLException e){out.println(e);
  System.out.println("연결에러");}
%>
      </div>
      </div>
      
</body>
</html>