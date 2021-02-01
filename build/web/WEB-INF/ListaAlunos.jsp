<%-- 
    Document   : ListaAlunos
    Created on : 17/05/2019, 12:35:57
    Author     : Anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 TRANSITIONAL //EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Aluno</title>
    </head>
    <body>
        <h1>Emprestimo de Livro - Selecione o RA</h1>
        <table border="1">
            
            <thead>
                <tr>
                    <th>RA</th><th>Nome</th><th>Cidade</th><th>Telefone</th><th>E-mail</th>
                </tr>
            </thead>
            
            <%
                Connection conn= null;
                Statement st = null;
                ResultSet rs = null;
                
                try
                {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
                st = conn.createStatement();
                rs = st.executeQuery("select RA, Nome, Cidade, Telefone, email from tbaluno");
                
                while(rs.next())
                {
                    String RA = rs.getString("RA");
                    String Nome = rs.getString("Nome");
                    String Cidade = rs.getString("Cidade");
                    String Telefone = rs.getString("Telefone");
                    String Email = rs.getString("Email");
                    
                    out.println("<tr>");
                    out.println("<td><a href = 'alunoemprestimo.jsp?RA="+RA+"'>"+RA+"</a></td><td>"+Nome+"/td");
                    out.println("<td>"+Cidade+"</td><td>"+Telefone+"</td><td>"+Email+"</td>");
                    out.println("</tr>");
                }//fim do while = estrutura de repetição.
                
                }
                catch(Exception ex)
                {
                    ex.printStackTrace();
                }
                finally
                {
                    if(rs != null)rs.close();
                    if(st != null)st.close();
                    if(conn != null)conn.close();
                }
                %>
            
        </table>
    </body>
</html>
