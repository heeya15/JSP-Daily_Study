/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.60
 * Generated at: 2020-12-15 10:42:06 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dto.Product;

public final class product_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("dto.Product");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
      out.write(' ');
      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');
      dao.ProductRepository productDAO = null;
      synchronized (session) {
        productDAO = (dao.ProductRepository) _jspx_page_context.getAttribute("productDAO", javax.servlet.jsp.PageContext.SESSION_SCOPE);
        if (productDAO == null){
          productDAO = new dao.ProductRepository();
          _jspx_page_context.setAttribute("productDAO", productDAO, javax.servlet.jsp.PageContext.SESSION_SCOPE);
        }
      }
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<link rel = \"stylesheet\" href= \"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\">\r\n");
      out.write("<title>상품 상세 정보</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t");
      out.write('\r');
      out.write('\n');
      out.write('	');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "menu.jsp", out, false);
      out.write(" \r\n");
      out.write("    <div class = \"jumbotron\">\r\n");
      out.write("    \t<div class = \"container\">\r\n");
      out.write("    \t\t<h1 class= \"display-3\">상품정보</h1>\r\n");
      out.write("    \t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t");
 
		/*21행은 products.jsp를실행후 상세정보 버튼을 눌러서 상품 코드가 P1234인 상품을 눌러 상세정보를 보려고할경우 
		주소창에는 http://localhost:9090/WebMarket/product.jsp?id=P1234 에서
		[ P1234를 ] 들고와서 id 변수에 저장.*/
	   String id = request.getParameter("id");
		/*그 후 useBean 액션 태그에 id속성값을 통해 ProductRepository클래스에 getProductById()메소드를 호출하여
		반환된 결과 값을 Product 객체타입 변수 product에 저장함. 
		즉, 넘겨받은 [ id에 저장된 상품 코드가 ]  Product 객체중 [ 기존에 저장되어있는 상품코드가 있을경우 저장 ]. */
	   Product product = productDAO.getProductById(id);
	
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t<div class = \"container\">\r\n");
      out.write("    \t<div class = \"row\" >\r\n");
      out.write("    \t\t<div class=\"col-md-6\">\r\n");
      out.write("    \t\t\t<h3>");
      out.print(product.getPname() );
      out.write("</h3>\r\n");
      out.write("    \t\t\t<h3>");
      out.print(product.getDescription() );
      out.write("</h3>\r\n");
      out.write("    \t\t\t<p><b>상품 코드 :</b><span class=\"badge badge-danger\">\r\n");
      out.write("    \t\t\t\t");
      out.print(product.getProductId() );
      out.write("</span>\r\n");
      out.write("    \t\t\t<p><b>제조사 </b> :");
      out.print(product.getManufacturer() );
      out.write("\r\n");
      out.write("    \t\t\t<p><b>분류 </b> :");
      out.print(product.getCategory() );
      out.write("\r\n");
      out.write("    \t\t\t<p><b>재고 수 </b> :");
      out.print(product.getUnitsInStock() );
      out.write("\r\n");
      out.write("    \t\t\t<h4>");
      out.print(product.getUnitPrice() );
      out.write("원</h4>\r\n");
      out.write("    \t\t\t<p> <a href=\"#\" class=\"btn btn-info\">상품 주문 &raquo;</a>\r\n");
      out.write("    \t\t\t<a href=\"./products.jsp\" class=\"btn btn-secondary\">상품 목록 &raquo;</a>\r\n");
      out.write("    \t\t</div>\t\t\t\r\n");
      out.write("    \t</div>\r\n");
      out.write("    \t<hr>\r\n");
      out.write("\t</div>");
      out.write('\r');
      out.write('\n');
      out.write('	');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
