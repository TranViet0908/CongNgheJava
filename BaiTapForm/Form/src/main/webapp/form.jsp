<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form sản phẩm</title>
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
        .form-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input, .form-group textarea {
            width: 265px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group textarea {
            width: 100%;
            height: 100px;
            resize: vertical;
        }
        .form-group .full-width {
            width: 97%;
        }
        .submit-btn {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        .submit-btn:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <form action="submit.jsp" method="POST" onsubmit="return validateForm()">
            <div class="form-group">
                <div>
                    <label for="product-code">Mã sản phẩm <span style="color: red;">*</span></label>
                    <input type="text" id="product-code" name="product-code" required>
                </div>
                <div>
                    <label for="product-name">Tên sản phẩm <span style="color: red;">*</span></label>
                    <input type="text" id="product-name" name="product-name" required>
                </div>
            </div>
            <div class="form-group">
                <div>
                    <label for="purchase-price">Giá nhập <span style="color: red;">*</span></label>
                    <input type="text" id="purchase-price" name="purchase-price" required>
                </div>
                <div>
                    <label for="sale-price">Giá bán <span style="color: red;">*</span></label>
                    <input type="text" id="sale-price" name="sale-price" required>
                </div>
            </div>
            <div class="form-group">
                <div>
                    <label for="expiry-date">Hạn sử dụng</label>
                    <input type="date" id="expiry-date" name="expiry-date">
                </div>
                <div>
                    <label for="vat">VAT</label>
                    <input type="text" id="vat" name="vat">
                </div>
            </div>
            <div class="form-group">
                <div class="full-width">
                    <label for="description">Mô tả sản phẩm</label>
                    <textarea id="description" name="description"></textarea>
                </div>
            </div>
            <button type="submit" class="submit-btn">Lưu sản phẩm</button>
        </form>
    </div>
    <script>
        function validateForm() {
            let isValid = true;

            const productCode = document.getElementById('product-code').value.trim();
            const productName = document.getElementById('product-name').value.trim();
            const purchasePrice = document.getElementById('purchase-price').value.trim();
            const salePrice = document.getElementById('sale-price').value.trim();

            // Reset errors
            document.getElementById('product-code-error').textContent = '';
            document.getElementById('product-name-error').textContent = '';
            document.getElementById('purchase-price-error').textContent = '';
            document.getElementById('sale-price-error').textContent = '';

            if (productCode === '') {
                document.getElementById('product-code-error').textContent = 'Vui lòng nhập mã sản phẩm.';
                isValid = false;
            }
            if (productName === '') {
                document.getElementById('product-name-error').textContent = 'Vui lòng nhập tên sản phẩm.';
                isValid = false;
            }
            if (purchasePrice === '') {
                document.getElementById('purchase-price-error').textContent = 'Vui lòng nhập giá nhập.';
                isValid = false;
            }
            if (salePrice === '') {
                document.getElementById('sale-price-error').textContent = 'Vui lòng nhập giá bán.';
                isValid = false;
            }
            if (purchasePrice !== '' && salePrice !== '' && parseFloat(salePrice) <= parseFloat(purchasePrice)) {
                document.getElementById('sale-price-error').textContent = 'Giá bán phải lớn hơn giá nhập.';
                isValid = false;
            }

            return isValid;
        }
    </script>
</body>
</html>
