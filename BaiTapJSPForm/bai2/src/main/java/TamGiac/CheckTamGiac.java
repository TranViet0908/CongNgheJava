package TamGiac;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/CheckTamGiac")
public class CheckTamGiac extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int a = Integer.parseInt(req.getParameter("sideA"));
		int b = Integer.parseInt(req.getParameter("sideB"));
		int c = Integer.parseInt(req.getParameter("sideC"));
		String LoaiTamGiac;
		if(a<=0 || b<=0 || c<=0 || (a + b <= c) || (a + c <= b) || (b + c <= a)) {
			LoaiTamGiac = "Không phải tam giác";
		} else if(a == b && a == c) {
			LoaiTamGiac = "Tam giác đều";
		} else if(a == b || a == c || b == c) {
			LoaiTamGiac = "Tam giác cân";
		} else if( a*a == b*b + c*c || b*b == a*a + c*c || c*c == a*a + b*b) {
			LoaiTamGiac = "Tam giác vuông";
		} else if( (a*a == b*b + c*c || b*b == a*a + c*c || c*c == a*a + b*b) && (a == b || a == c || b == c)) {
			LoaiTamGiac = "Tam giác vuông cân";
		} else LoaiTamGiac = "Tam giác thường";
		
		resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println("<html><body>");
        out.println("<h2>Tính chất của tam giác: " + LoaiTamGiac + "</h2>");
        out.println("<a href='NhapTamGiac.jsp'>Nhập lại</a>");
        out.println("</body></html>");

	}
}
