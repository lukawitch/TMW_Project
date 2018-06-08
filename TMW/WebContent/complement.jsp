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
//String ID ="'sujin123'";
String sql1="select emittype as 배출유형, sum(quantity) as 회원총배출량 from waste group by  emittype order by emittype";
String sql2="select emittype as 배출유형, sum(quantity)/count(distinct id) as 회원평균배출량 from waste group by  emittype order by emittype";
String sql3="select id, emittype as 배출유형, sum(quantity) as 개인총배출량 from waste where id="+ID+"group by id, emittype order by emittype";
List<String>replecement=new ArrayList<String>();
List<Integer>total=new ArrayList<Integer>();
List<Double>average=new ArrayList<Double>();
List<Integer>person=new ArrayList<Integer>();

try
 {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection(url, id, pw);
    System.out.println("연결확인");
    
    ps=con.prepareStatement(sql1);
    rs = ps.executeQuery();
    while(rs.next()){
    	replecement.add(rs.getString(1));
    	total.add(rs.getInt(2));
       }
    ps=con.prepareStatement(sql2);
    rs = ps.executeQuery();
    while(rs.next()){
    
    	average.add(rs.getDouble(2));
       }
    ps=con.prepareStatement(sql2);
    rs = ps.executeQuery();
    while(rs.next()){
    
    	average.add(rs.getDouble(2));
       }
    ps=con.prepareStatement(sql3);
    rs = ps.executeQuery();
    while(rs.next()){
        
    	person.add(rs.getInt(3));
       }
   
    %>
     <%@include file="nav.jsp"%>
        
   <div class="container">
      <br>
   <br>
   <br>
<h2 >전체회원과 비교한 <%=name %>의쓰레기 배출량</h2>
      <div class="row">
      <% String avg; 
for(int i=0;i<replecement.size();i++){
String image=replecement.get(i);
if((double)person.get(i)==average.get(i)){
	avg="평균";
}
else if((double)person.get(i)>average.get(i)){
	avg="평균이하";
}
else
{avg="평균이상";}%>
  <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="./image/<%=image%>.png" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <%= replecement.get(i)%>
                  </h4>
                  <h5> <%= avg%></h5>
                  <h5> <%=((double)person.get(i)/(double)total.get(i))*100 %></h5>
                  <p class="card-text"> <%= replecement.get(i)%>의 배출정도는  <%=avg%>이며 비율은<%=((double)person.get(i)/(double)total.get(i))*100 %>입니다</p>
                </div>
                
              </div>
            </div>

  <%} %>
    <%  }catch(SQLException e){out.println(e);
  System.out.println("연결에러");}
%>
</body>
</html>