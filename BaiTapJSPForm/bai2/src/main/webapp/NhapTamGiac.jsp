<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tam Giác</title>
</head>
<body>
	<h2>Nhập ba cạnh của tam giác:</h2>
    <form action="CheckTamGiac" method="post">
        Cạnh a: <input type="number" name="sideA" min="1" required><br>
        Cạnh b: <input type="number" name="sideB" min="1" required><br>
        Cạnh c: <input type="number" name="sideC" min="1" required><br>
        <input type="submit" value="Kiểm tra tính chất tam giác">
    </form>
</body>
</html>