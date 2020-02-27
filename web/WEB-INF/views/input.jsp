<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: xiangxinli
  Date: 2020/2/27
  Time: 4:07 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <!--
        1. WHY 使用 form标签？
        可以更快速的开发出表单页面，而且可以更方便的进行表单值的回显
        2. 注意
        可以通过modelAttribute 属性指定绑定的模型属性，若没有指定该属性，则默认从request域对象中读取command的表单bean.
        如果该属性值也不存在，则会发生错误。
    -->
    <form:form action="emp" method="post" modelAttribute="employee">
        <!-- path属性对应HTML表单标签的name属性值 -->
        LastName:<form:input path="lastName"/>
        <br>
        Email:<form:input path="email"/>
        <br>
        <%
            Map<String, String> genders = new HashMap<String, String>();
            genders.put("1", "Male");
            genders.put("0", "Female");

            request.setAttribute("genders", genders);
        %>
        Gender<form:radiobuttons path="gender" items="${genders }"/>
        <br>
        Department:<form:select path="department"
                                items="${departments}" itemLabel="departmentName" itemValue="id"/>
        <br>
        <input type="submit" value="Submit">
    </form:form>
</body>
</html>
