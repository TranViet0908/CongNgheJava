<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f5f5f5;
        }
        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 600px;
        }
        .error {
            color: red;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <%
            // Mock existing product codes
            String[] existingProductCodes = { "P001", "P002", "P003" };
            boolean isProductCodeExists = false;

            String productCode = request.getParameter("product-code");
            String productName = request.getParameter("product-name");
            String purchasePrice = request.getParameter("purchase-price");
            String salePrice = request.getParameter("sale-price");
            String expiryDate = request.getParameter("expiry-date");
            String vat = request.getParameter("vat");
            String description = request.getParameter("description");

            for (String code : existingProductCodes) {
                if (code.equals(productCode)) {
                    isProductCodeExists = true;
                    break;
                }
            }

            if (isProductCodeExists) {
                out.println("<div class='error'>Mã sản phẩm đã tồn tại. Vui lòng nhập mã khác.</div>");
                out.println("<form action='submit.jsp' method='POST'>");
                out.println("<input type='hidden' name='product-code' value='" + productCode + "'>");
                out.println("<input type='hidden' name='product-name' value='" + productName + "'>");
                out.println("<input type='hidden' name='purchase-price' value='" + purchasePrice + "'>");
                out.println("<input type='hidden' name='sale-price' value='" + salePrice + "'>");
                out.println("<input type='hidden' name='expiry-date' value='" + expiryDate + "'>");
                out.println("<input type='hidden' name='vat' value='" + vat + "'>");
                out.println("<input type='hidden' name='description' value='" + description + "'>");
                out.println("<button type='submit'>Quay lại để nhập mã khác</button>");
                out.println("</form>");
            } else {
                // Here you can save the product to the database
                out.println("<div>Sản phẩm đã được lưu thành công!</div>");
                out.println("<ul>");
                out.println("<li>Mã sản phẩm: " + productCode + "</li>");
                out.println("<li>Tên sản phẩm: " + productName + "</li>");
                out.println("<li>Giá nhập: " + purchasePrice + "</li>");
                out.println("<li>Giá bán: " + salePrice + "</li>");
                out.println("<li>Hạn sử dụng: " + expiryDate + "</li>");
                out.println("<li>VAT: " + vat + "</li>");
                out.println("<li>Mô tả sản phẩm: " + description + "</li>");
                out.println("</ul>");
            }
        %>
    </div>
</body>
</html>
