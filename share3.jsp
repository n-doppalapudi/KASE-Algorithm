<%@ include file="header.jsp"%>
<!-- //header-ends -->
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%! inti=0;
String skey=null,param,bsk;
%>
<%
try{
//String to=request.getParameter("to");
String aggkey=request.getParameter("aggkey");
String us[]=request.getParameterValues("users");
String users="";
for(inti=0;i<us.length;i++){
users=users+us[i]+", ";
}
users=users.substring(0, users.length() - 2);
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st1=con.createStatement();
ResultSet rs1=st1.executeQuery("select *from setup");
if(rs1.next())
{
param=rs1.getString(1);
}
%>
<div class="content">
<div class="women_main">
<!-- start content -->
<div class="grids">
<div class="progressbar-heading grids-heading">
</div>
<div class="panel panel-widget forms-panel">
<div class="forms">
<div class=" form-grids form-grids-right">
<div class="widget-shadow " data-example-id="basic-forms">
<div class="form-title">
<h4>Sharing Files</h4>
</div>
<div class="form-body">
<form class="form-horizontal" action="genBroadcastKey.jsp" method="post">
<div class="form-group"><label for="inputEmail3" class="col-sm-2 control-label">Public parameter  (<em>param</em> )</label>
<div class="col-sm-9"><input type="text" name="param" value=<%=param%> class="form-control" id="inputEmail3" readonly></div></div>
<div class="form-group"><label for="inputEmail3" class="col-sm-2 control-label">Aggregate&nbsp;Key&nbsp;(&nbsp;Ks&nbsp;)</label>
<div class="col-sm-9"><textarea name="aggkey" class="form-control" id="inputEmail3" readonly><%=aggkey%></textarea></div></div>
<div class="form-group"><label for="inputEmail3" class="col-sm-2 control-label">Users ( S )</label><div class="col-sm-9"><textarea name="users" class="form-control" id="inputEmail3" readonly><%=users%></textarea></div></div>
<div class="form-group"><div class="col-sm-offset-2 col-sm-10"><button type="submit" class="btnbtn-default">Share to Users</button></div></form>
</div>
</div>
</div>
</div>	
</div>
<%
}catch(Exception e)
{
e.printStackTrace();
}%>		
<br><br><br><br><br>
<%@ include file="ownerfooter.jsp"%>
