<%-- 
    Document   : empConsultaEmprestimoAluno
    Created on : 16/05/2019, 23:07:21
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.text.*,java.util.*,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        LISTA DE LIVROS EMPRESTADOS POR ALUNO
        <table border="1">
            <thead>
                <tr>
                    <th>RA</th><th>Nome</th><th>ISBN</th><th>Titulo</th><th>Autor</th>
                    <th>Data Emprestimo</th><th>Data Devolucao</th>
                </tr>
                
            </thead>
            <%
                String RA=request.getParameter("RA").trim();
                
                 Connection conn=null;
           PreparedStatement pst=null;
           ResultSet rs=null;
           
            try{
              Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bancofaculdade","root","");
pst=conn.prepareStatement("SELECT tbEmprestimo.EmpAluno,tbaluno.Nome,tbEmprestimo.EmpISBN,tbLivros.Titulo,tbLivros.Autor,tbEmprestimo.EmpData,tbEmprestimo.EmpDevolucao FROM tbLivros INNER JOIN(tbaluno INNERJOIN tbEmprestimo ON tbaluno.RA=tbEmprestimo.EmpAluno)ON tbLivros.ISBN= tbEmprestimo.EmpISBN WHERE (tbEmprestimo.EmpAluno=?)");
pst.setString(1, RA);
rs=pst.executeQuery();
pst.clearParameters();

SimpleDateFormat dataEmp= new SimpleDateFormat("dd/MM/yyyy");
SimpleDateFormat dataDev= new SimpleDateFormat("dd/MM/yyyy");
while(rs.next()){
    
    

            %>
            <tr>
                <td><%=rs.getString("EmpAluno")%></td>
                <td><%=rs.getString("Nome")%></td>
                <td><%=rs.getString("EmpISBN")%></td>
                <td><%=rs.getString("Titulo")%></td>
                <td><%=rs.getString("Autor")%></td>
                <td><%=dataEmp.format(rs.getDate("EmpData"))%></td>
                <td><%=dataDev.format(rs.getDate("EmpDevolucao"))%></td>
                
            </tr>
           <%
}
            }
            catch(Exception ex){
                
                ex.printStackTrace();
            }
            finally{
                
                if(rs!=null)rs.close();
                if(conn!=null)conn.close();
            }
           %>
        </table>
        <a href="index.jsp"><font color="red" size="6"><b>MENU</b></font></a>
    </body>
</html>
