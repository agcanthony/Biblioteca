package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class empCadastroEmprestimo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    
    
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Livro: ");
      out.print(ISBN);
      out.write(" cadastrado.</h1>\n");
      out.write("        <h1>RA: ");
      out.print(RA);
      out.write(" cadastrado.</h1>\n");
      out.write("        <h1>Data Emprestimo: ");
      out.print(dataEmprestimo);
      out.write(" cadastro.</h1>\n");
      out.write("        <h1>Data devolucao: ");
      out.print(dataDevolucao);
      out.write(" cadastrado.</h1>\n");
      out.write("        <a href=\"index.html\"><font color=\"red\" size=\"6\"><b>Menu</b></font></a>\n");
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
