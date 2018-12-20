<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>上传单个文件示例</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" type="text/css"/>
</head>
<body>
<div align="center">

    <h1>上传附件</h1>
    <form method="post" action="/project/upload" enctype="multipart/form-data">
        <input type="file" name="file"/>
        <input type="text" name="devTypeID">
        <button type="submit">提交</button>
    </form>


    <script>
        function selectUser() {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    document.getElementById("test").innerHTML = xmlhttp.responseText;
                }
            }
            xmlhttp.open("POST", "test/add", true);
            xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xmlhttp.send("testID=9");
        }

        function login() {
            $.ajax({
                url: "user/login",
                data: {
                    userName: $("#name").value,
                    userPassword: $("#pwd").value
                },
                success: function (result) {
                    res = eval("(" + result + ")");
                    if (res.code == 101) {
                        window.location.href = "main.html";
                    }
                }
            })
        }
    </script>
    <h1>新增试验单</h1>
    <p id="test">Hello World!</p>
    <button type="button" onclick="selectUser()">onclick test</button>

    <input type="text" name="用户名" id="name">
    <input type="text" name="密码" id="pwd">
    <button onclick="login()">登陆</button>
</div>
</body>
</html>