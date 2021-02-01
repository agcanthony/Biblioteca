<%-- 
    Document   : alunoemprestimo
    Created on : 17/05/2019, 15:40:39
    Author     : Anthony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import = "java.sql.*, java.text.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 TRANSITIONAL //EN""http://www.w3.org/TR/xhtml/DTD/xhtml-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Emprestimos de livros</title>
    </head>
    <body>
        <% 
            String RA = request.getParameter("RA").trim();
            
            if(RA != null)
            {
                Connection conn = null;
                PreparedStatement pst = null;
                ResultSet rs = null;
                
                Statement st = null; 
                ResultSet rsLiv = null;
                
                try
                {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
                st = conn.createStatement();
                rsLiv = st.executeQuery("Select ISBN, Titulo, Autor, Editora from tblivros");
                
                pst = conn.prepareStatement("Select * From tbaluno where RA = ?");
                pst.setString(1, RA);
                rs = pst.executeQuery();
                pst.clearParameters();
                
                if(rs.next())
                {
                    //out.println("<form action = 'CadatroEmptrestimo.jsp' method = 'get'");
                
                
            
        %>
        
        <table>
            <tr>
                <td>RA...</td>
                <td><input type="text" name="RA" value="<%=rs.getString("RA")%>" readonly="readonly"/></td>
                
                <td>Nome...</td>
                <td><input type="text" name="Nome" value="<%=rs.getString("Nome")%>" readonly="readonly"/></td>
            </tr>
            <tr>
                <td>Cidade...</td>
                <td><input type="text" name="Cidade" value="<%=rs.getString("Cidade")%>" readonly="readonly"/></td>
                
                <td>Telefone...</td>
                <td><input type="text" name="Telefone" value="<%=rs.getString("Telefone")%>" readonly="readonly"/></td>
                
                <td>Email...</td>
                <td><input type="text" name="Email" value="<%=rs.getString("Email")%>" readonly="readonly"/></td>
            </tr>
            <tr><td></td><td></td><td><a href="index.jsp"><font color="red" size="6"><b>CANCELA</b></font></a></td></tr>
            <tr></tr><tr></tr><tr></tr>
        </table>
            
            <td>Selecione o ISBN para emprestimo</td>
            <table border="1">
                <%
                    //Lista livros Cadastrado
                    out.println("<tr><td><b>ISBN</b></td><td><b>Titulo</b></td><td><b>Editora</b></td></tr");
                    while(rsLiv.next())
                    {
                        String ISBN = rsLiv.getString("ISBN");
                        String Titulo = rsLiv.getString("Titulo");
                        String Autor = rsLiv.getString("Autor");
                        String Editora = rsLiv.getString("Editora");
                    
                        out.println("<tr>");
                        out.println("<td><a href='ComfirmaEmprestimo.jsp?ISBN="+ISBN+"&RA="+RA+"'>"+ISBN+"</td><td>"+Titulo+"</td");
                        out.println("<td>"+Autor+"</td><td>"+Editora+"</td>");
                        out.println("</tr>");
                    }//fim do while
                    
                    %>
            </table>
            
                    <%
                     }//fecha if
                else{
                     out.println("Aluno não Encontrado");
                    }
                    }//fecha try
                catch (Exception ex)
                    {
                       ex.printStackTrace();
                    }
                finally
                    {
                        if(pst != null)pst.close();
                        if(conn != null)conn.close();
                    }
                   %>
    </body>
</html>
