package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.text.*;
import java.util.*;
import java.text.SimpleDateFormat;

public final class empConfirmaEmprestimo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        ");

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
           
       
       
       
       
      out.write("\n");
      out.write("       \n");
      out.write("       <form action=\"empCadastroEmprestimo.jsp\" method=\"post\">\n");
      out.write("           <table>\n");
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
      out.write("                    <tr>\n");
      out.write("                        <td>ISBN ...</td>\n");
      out.write("                        <td><input type=\"text\" name=\"ISBN\" value=\"");
      out.print(ISBN);
      out.write("\" readonly=\"readonly\"/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td> Data emprestimo...</td><td><font color=\"red\" > Formato (dd/mm/aaaa)</font></td>\n");
      out.write("                        <td><input type=\"text\" name=\"dataEmprestimo\"/></td>\n");
      out.write("                    </tr>\n");
      out.write("                   <tr>\n");
      out.write("                        <td> Data Devolucao...</td><td><font color=\"red\" > Formato (dd/mm/aaaa)</font></td>\n");
      out.write("                        <td><input type=\"text\" name=\"dataDevolucao\"/></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <tr><td><a href=\"index.jsp\"><font color=\"red\" size=\"6\"><b>Cancela</b></font></a></td></tr>\n");
      out.write("                    <td><input type=\"submit\" name=\"btConfirmaEmprestimo\" value=\"Confirma EMprestimo\"/></td>\n");
      out.write("                        \n");
      out.write("                    </tr>\n");
      out.write("           </table>\n");
      out.write("       </form>\n");
      out.write("                    ");

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
                    
      out.write("\n");
      out.write("           \n");
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
