<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
String sql1="select emitType, sum(quantity) as 총배출량 from waste where id = "+ID+"group by emitType order by sum(quantity) desc";
List<String>EMITTYPE = new ArrayList<String>();
int i=0;
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
<h2 ><%=name %>님의 배출유형별 순위와 배출량을 알려드립니다 </h2>
      <div class="row">
    <% 
    while(rs.next()){
    	%>
       <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="./image/<%= rs.getString(1)%>.png" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <%= rs.getString(1)%>
                  </h4>
                  <h5> <%= rs.getString(2)%></h5>
                  <p class="card-text"> <%= rs.getString(1)%>의 총 배출량은  <%= rs.getString(2)%>입니다</p>
                </div>
                
              </div>
            </div>
<%}%>
      <%  }catch(SQLException e){out.println(e);
  System.out.println("연결에러");}
%>
     
      </div>
      </div>
 <%@include file="footer.jsp"%>
</body>
</html>