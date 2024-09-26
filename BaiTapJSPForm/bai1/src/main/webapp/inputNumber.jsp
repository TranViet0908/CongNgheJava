<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nhập Số Nguyên Dương</title>
</head>
<body>
    <h2>Nhập một số nguyên dương:</h2>
    <form action="SumDigitsServlet" method="post">
        <input type="number" name="number" min="1" required>
        <input type="submit" value="Tính tổng các chữ số">
    </form>
</body>
</html>
