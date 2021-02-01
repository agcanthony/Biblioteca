package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import java.text.SimpleDateFormat;

public final class empAlunoEmprestimo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         ");

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
         
     
   
      out.write("\n");
      out.write("     <form action=\"AtualizaAlunos.jsp\" method=\"get\">\n");
      out.write("          <table>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>RA...</td>\n");
      out.write("                        <td><input type=\"text\" name=\"RA\" value=\"");
      out.print(rs.getString("RA"));
      out.write("\" readonly=\"readonly\"/></td>\n");
      out.write("                       \n");
      out.write("                    </tr>\n");
      out.write("                     <tr>\n");
      out.write("                        <td>Nome...</td>\n");
      out.write("                        <td><input type=\"text\" name=\"Nome\" value=\"");
      out.print(rs.getString("Nome"));
      out.write("\" readonly=\"readonly\"/></td>\n");
      out.write("                       \n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Cidade...</td>\n");
      out.write("                        <td><input type=\"text\" name=\"Cidade\" value=\"");
      out.print(rs.getString("Cidade"));
      out.write("\"readonly=\"readonly\" /></td>\n");
      out.write("                       \n");
      out.write("                    </tr>\n");
      out.write("                     <tr>\n");
      out.write("                        <td>Telefone...</td>\n");
      out.write("                        <td><input type=\"text\" name=\"Telefone\" value=\"");
      out.print(rs.getString("Telefone"));
      out.write("\" readonly=\"readonly\"/></td>\n");
      out.write("                       \n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>E-mail...</td>\n");
      out.write("                        <td><input type=\"text\" name=\"eMail\" value=\"");
      out.print(rs.getString("eMail"));
      out.write("\" readonly=\"readonly\"/></td>\n");
      out.write("                       \n");
      out.write("                    </tr>\n");
      out.write("          </table>\n");
      out.write("              SELECIONE O ISBN PARA EMPRESTIMO\n");
      out.write("              <table border=\"1\">\n");
      out.write("                  \n");
      out.write("                  ");

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
                  
      out.write("\n");
      out.write("              </table>\n");
      out.write("                  ");

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
                  
                  
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
