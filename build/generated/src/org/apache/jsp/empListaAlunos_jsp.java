package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;

public final class empListaAlunos_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <table border=\"1\">\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th>RA</th><th>Nome</th><th>Nascimento</th><th>Cidade</th><th>Estado</th><th>Telefone</th><th>E-mail</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("     ");

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

      out.write("\n");
      out.write(" \n");
      out.write("        </table>\n");
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
