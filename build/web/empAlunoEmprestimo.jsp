<%-- 
    Document   : empAlunoEmprestimo
    Created on : 16/05/2019, 20:06:51
    Author     : aluno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*,java.text.*,java.util.*,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
   String RA=request.getParameter("RA");
   if(RA!=null){
    
              Connection conn = null;
              PreparedStatement pst=null;
              ResultSet rs=null;
              
               Statement st=null;
              ResultSet rsLiv=null;
              try{
              Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bancofaculdade","root","");
       st=conn.createStatement();
     rsLiv=st.executeQuery("select ISBN, Titulo, Autor, Editora from tbLivros");
     pst=conn.prepareStatement("select * from tbaluno where RA=?");
     pst.setString(1, RA);
     rs=pst.executeQuery();
     pst.clearParameters();
     
     if(rs.next()){
         
     
   %>
     <form action="AtualizaAlunos.jsp" method="get">
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
          </table>
              SELECIONE O ISBN PARA EMPRESTIMO
              <table border="1">
                  
                  <%
                  out.println("<tr><td><b>ISBN</b></td><td><b>Titulo</b><td><b>Autor</b></td><td><b>Editora</b></td>");
                  while(rsLiv.next()){
                    
                      String ISBN=rsLiv.getString("ISNB");
                      String Titulo=rsLiv.getString("Titulo");
                      String Autor=rsLiv.getString("Autor");
                      String Editora=rsLiv.getString("Editora");
                      
                      out.println("<tr>");
                      out.println("<td><a href='empConfirmaEmprestimo.jsp?ISBN="+ISBN+"&RA="+RA+"'>"+ISBN+"</td><td>"+Titulo+"</td>");
                      out.println("<td>"+Autor+"</td><td>"+Editora+"</td>");
                      out.println("</tr>");
                      
                  }
                  %>
              </table>
                  <%
     }
     else {
         
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
