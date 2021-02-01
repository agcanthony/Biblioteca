<%-- 
    Document   : empListaAlunos
    Created on : 16/05/2019, 20:01:34
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>RA</th><th>Nome</th><th>Nascimento</th><th>Cidade</th><th>Estado</th><th>Telefone</th><th>E-mail</th>
                </tr>
            </thead>
     <%
Connection conn = null;
Statement st = null;
ResultSet rs = null;


try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
st = conn.createStatement();
rs = st.executeQuery("select RA, Nome, DataNasc, Cidade, Estado, Telefone, eMail from tbAlunos");

SimpleDateFormat DataNas=new SimpleDateFormat("dd/MMM/yyyy");

while(rs.next())
{
    String RA=rs.getString("RA");
     String NomeAluno=rs.getString("Nome");
      String Nasc=rs.getString("DataNasc");
       String Cidade=rs.getString("Cidade");
        String Estado=rs.getString("Estado");
         String Telefone=rs.getString("Telefone");
          String eMail=rs.getString("eMail");

          out.println("<tr>");
          out.println("<td><a href='empAlunoEmprestimo.jsp?RA="+RA+"'>"+RA+"</a></td><td>"+NomeAluno+"</td>");
          out.println("<td>"+Nasc+"</td><td>"+Cidade+"</td><td>"+Estado+"</td><td>"+Telefone+"</td><td>"+eMail+"</td>");
          out.println("</tr>");
} 
}
catch (Exception ex)
{
ex.printStackTrace();
}
finally
{
if (rs != null) rs.close();
if (st != null) st.close();
if (conn != null) conn.close();
}
%>
 
        </table>
    </body>
</html>
