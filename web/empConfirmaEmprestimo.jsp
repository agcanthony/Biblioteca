<%-- 
    Document   : empConfirmaEmprestimo
    Created on : 16/05/2019, 22:21:31
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"import="java.sql.*,java.text.*,java.util.*,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
       String ISBN=request.getParameter("ISBN").trim();
       String RA=request.getParameter("RA").trim();
       
       if(RA!=null){
           
           Connection conn=null;
           PreparedStatement pst=null;
           ResultSet rs=null;
           
            try{
              Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bancofaculdade","root","");
       pst=conn.prepareStatement("select * from tbaluno where RA=?");
       pst.setString(1,RA);
       rs=pst.executeQuery();
       pst.clearParameters();
       
       if(rs.next()){
           
       
       
       
       %>
       
       <form action="empCadastroEmprestimo.jsp" method="post">
           <table>
                    <tr>
                        <td>RA...</td>
                        <td><input type="text" name="RA" value="<%=rs.getString("RA")%>" readonly="readonly"/></td>
                       
                    </tr>
                     <tr>
                        <td>Nome...</td>
                        <td><input type="text" name="Nome" value="<%=rs.getString("Nome")%>" readonly="readonly"/></td>
                       
                    </tr>
                    <tr>
                        <td>Cidade...</td>
                        <td><input type="text" name="Cidade" value="<%=rs.getString("Cidade")%>"readonly="readonly" /></td>
                       
                    </tr>
                     <tr>
                        <td>Telefone...</td>
                        <td><input type="text" name="Telefone" value="<%=rs.getString("Telefone")%>" readonly="readonly"/></td>
                       
                    </tr>
                    <tr>
                        <td>E-mail...</td>
                        <td><input type="text" name="eMail" value="<%=rs.getString("eMail")%>" readonly="readonly"/></td>
                       
                    </tr>
                    <tr>
                        <td>ISBN ...</td>
                        <td><input type="text" name="ISBN" value="<%=ISBN%>" readonly="readonly"/></td>
                    </tr>
                    <tr>
                        <td> Data emprestimo...</td><td><font color="red" > Formato (dd/mm/aaaa)</font></td>
                        <td><input type="text" name="dataEmprestimo"/></td>
                    </tr>
                   <tr>
                        <td> Data Devolucao...</td><td><font color="red" > Formato (dd/mm/aaaa)</font></td>
                        <td><input type="text" name="dataDevolucao"/></td>
                    </tr>
                    <tr>
                        <tr><td><a href="index.jsp"><font color="red" size="6"><b>Cancela</b></font></a></td></tr>
                    <td><input type="submit" name="btConfirmaEmprestimo" value="Confirma EMprestimo"/></td>
                        
                    </tr>
           </table>
       </form>
                    <%
       }
       else{
           out.println("Aluno nao encontrado");
           
       }
            }
            
           catch(Exception ex){
               
               ex.printStackTrace();
           }
            finally{
                
                if(pst!=null)pst.close();
                if(conn!=null)conn.close();
            }
       }
                    %>
           
    </body>
</html>
