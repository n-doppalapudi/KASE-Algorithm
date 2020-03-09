<%@ include file="header.jsp"%>
<%@ page import="databaseconnection.*,PKE.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%!StringthisLine = null;
StringBuffer sb1=null;
String filename=null,pkey=null,fid=null,fnm=null,msk,bsk;
String filedata=null,filedata1=null,param;
%>
<%  fnm=request.getParameter("fname");
fid=request.getParameter("fid");
filedata=request.getParameter("file");
try{
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st1=con.createStatement();
ResultSet rs1=st1.executeQuery("select *from setup");
if(rs1.next())
{
param=rs1.getString(1);
}
ResultSetrs=st.executeQuery("select msk,bsk from osignup where unm='"+(String)session.getAttribute("uid")+"'");
if(rs.next())
{
msk=rs.getString(1);
bsk=rs.getString(2);
}
Statement st2=con.createStatement();
ResultSetrr=st2.executeQuery("select fdata from temp where fid='"+fid+"'");
if(rr.next())
{
byte b[]=rr.getBytes(1);
filedata1=new String(b);
PreparedStatementpst=con.prepareStatement("insert into cloud values(?,?,AES_ENCRYPT(?,'"+bsk+"'),?) ");
pst.setString(1,fid);
pst.setString(2,fnm);
pst.setBytes(3,rr.getBytes(1));
pst.setString(4,(String)session.getAttribute("uid"));
//pst.setBytes(5,rr.getBytes(2));
pst.executeUpdate();
}
Statement st3=con.createStatement();
st3.executeUpdate("delete from temp");
Statement st22=con.createStatement();
ResultSetrrr=st22.executeQuery("select fdata from cloud where fid='"+fid+"'");
if(rrr.next())
{
byte b[]=rrr.getBytes(1);
filedata1=new String(b);
}
}catch(Exception e ){e.printStackTrace();}
%>
<!--content-->
<div class="content">
<div class="women_main">
<!-- start content -->
<div class="grids">
<div class="progressbar-heading grids-heading">
</div>
<div class="panel panel-widget forms-panel
<div class="forms">
<div class=" form-grids form-grids-right">
<div class="widget-shadow " data-example-id="basic-forms">
<div class="form-title">
<h4>File Upload</h4>
</div>
<div class="form-body">
<form class="form-horizontal" action="fileupload.jsp?msg=Uploaded"  method="post">
<div class="form-group"><label for="inputEmail3" class="col-sm-2 control-label">Data Class ( i )</label>
<div class="col-sm-9"><input type="text" name="fid" value=<%=fid%> class="form-control" id="inputEmail3" readonly></div></div>
<div class="form-group"><label for="inputPassword3" class="col-sm-2 control-label">File Name</label>
<div class="col-sm-9">
<input type="text" class="form-control" id="inputPassword3" name="fname" value=<%=fnm%>readonly></div></div>
<div class="form-group"><label for="inputPassword3" class="col-sm-2 control-label">Ciphertext ( C )</label><div class="col-sm-9"><textarea class="form-control" id="inputPassword3" name="file" cols="5" rows="10" readonly><%=filedata1%></textarea></div></div>
<div class="form-group"><div class="col-sm-offset-2 col-sm-10"><button type="submit" class="btnbtn-default">Upload to Cloud</button></div></form>
</div>
</div>
</div>
</div>	
</div>
<br><br><br>
<%@ include file="ownerfooter.jsp"%>

