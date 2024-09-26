package bailam;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet("/SumDigitsServlet")
public class SumDigitsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy số từ request
        String numberStr = request.getParameter("number");
        int number = Integer.parseInt(numberStr);
        int sum = 0;

        // Tính tổng các chữ số
        while (number > 0) {
            sum += number % 10; // Lấy chữ số cuối cùng
            number /= 10;       // Xóa chữ số cuối cùng
        }

        // Trả về kết quả
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h2>Tổng các chữ số là: " + sum + "</h2>");
        out.println("<a href='inputNumber.jsp'>Nhập số khác</a>");
        out.println("</body></html>");
    }
}