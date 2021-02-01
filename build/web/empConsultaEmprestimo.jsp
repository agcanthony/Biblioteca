<%-- 
    Document   : EmConsulta
    Created on : 17/05/2019, 20:19:14
    Author     : Anthony
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" import = "java.sql.*, java.text.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 TRANSITIONAL //EN""http://www.w3.org/TR/xhtml/DTD/xhtml-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista livros emprestados</title>
    </head>
    <body>
        LISTA DE LIVROS EMPRESTADOS
        <table border="1">
            <thead>
                <tr>
                    <th>RA</th><th>Nome</th><th>Titulo</th><th>ISBN</th><th>Titulo</th><th>Autor</th>
                    <th>Data Emprestimo</th><th>Data Devolução</th>
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
                
                rs = st.executeQuery("SELECT tbEmprestimos.EmpALuno,tbAluno.Nome,tbEmprestimo.EmpISBN, tbLivros.Titulo, tbLivros.Autor, tbEmprestimos.Data, tbEmprestimos.Devolucao FROM tbLibros INNER JOIN (tbAluno INNER JOIN tbEmprestimos ON tbAluno.RA = tbEmprestimo.Aluno) ON tbLivros.ISBN = tbEmprestimo.EmpISBN");
                
                SimpleDateFormat dataEmp = new SimpleDateFormat("dd/MM/yyyy");
                SimpleDateFormat dataDev = new SimpleDateFormat("dd/MM/yyyy");
                
                while(rs.next())
                {
                    %>
                    <tr>
                    <td><%=rs.getString("EmpAluno")%></td>
                    <td><%=rs.getString("NomeAluno")%></td>
                    <td><%=rs.getString("EmpISBN")%></td>
                    <td><%=rs.getString("Titulo")%></td>
                    <td><%=rs.getString("Autor")%></td>
                    <td><%=dataEmp.format(rs.getDate("EmpData"))%></td>
                    <td><%=dataDev.format(rs.getDate("EmpDevolucao"))%></td>
                    </tr>
                    
                    <%
                        }
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
