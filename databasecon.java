databasecon.java
packagedatabaseconnection;
importjava.sql.*;
public class databasecon
{
static Connection con;
public static Connection getconnection()
{
Try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/broadcastkeys","root","root");
}catch(Exception e)
{
System.out.println("class error"+e);
}
return con;
}
}
