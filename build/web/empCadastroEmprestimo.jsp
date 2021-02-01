<%-- 
    Document   : empCadastroEmprestimo
    Created on : 16/05/2019, 22:52:08
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<%
    String ISBN=request.getParameter("ISBN");
    String RA=request.getParameter("RA");
    String dataEmprestimo=request.getParameter("dataEmprestimo");
    String dataDevolucao=request.getParameter("dataDevolucao");
    
    Connection conn=null;
    PreparedStatement pst=null;
    
    try{
              Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bancofaculdade","root","");
String SQL="INSERT INTO tbEmprestimo(EmpISBN,EmpAluno,EmpData,EmpDevolucao)"+"values(?,?,?,?)";
pst=conn.prepareStatement(SQL);

pst.setString(1, ISBN);
pst.setString(2, RA);
pst.setString(3, dataEmprestimo);
pst.setString(4, dataDevolucao);

pst.executeUpdate();
pst.clearParameters();
    }
    catch(Exception ex){
        ex.printStackTrace();
    }
    finally{
        
        if(pst!=null)pst.close();
        if(conn!=null)conn.close();
    }
    
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Livro: <%=ISBN%> cadastrado.</h1>
        <h1>RA: <%=RA%> cadastrado.</h1>
        <h1>Data Emprestimo: <%=dataEmprestimo%> cadastro.</h1>
        <h1>Data devolucao: <%=dataDevolucao%> cadastrado.</h1>
        <a href="index.html"><font color="red" size="6"><b>Menu</b></font></a>
    </body>
</html>
