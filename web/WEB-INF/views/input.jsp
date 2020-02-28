<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <form action="testConversionServiceConverer" method="post">
        <!-- lastname-email-gender-department.id 例如：GG-gg@atguigu.com--0-105-->
        Employee:<input type="text" name="employee">
        <input type="submit" value="Submit">
    </form>
    <br><br>


    <!--
        1. WHY 使用 form标签？
        可以更快速的开发出表单页面，而且可以更方便的进行表单值的回显
        2. 注意
        可以通过modelAttribute 属性指定绑定的模型属性，若没有指定该属性，则默认从request域对象中读取command的表单bean.
        如果该属性值也不存在，则会发生错误。
    -->
    <form:form action="${pageContext.request.contextPath }/emp" method="post" modelAttribute="employee">

        <c:if test="${employee.id == null}">
            <!-- path属性对应HTML表单标签的name属性值 -->
            LastName:<form:input path="lastName"/>
        </c:if>
        <c:if test="${employee.id != null}">
            <form:hidden path="id"/>
            <input type="hidden" name="_method" value="PUT"/>
        </c:if>

        <br>
        Email:<form:input path="email"/>
        <br>
        <%
            Map<String, String> genders = new HashMap<String, String>();
            genders.put("1", "Male");
            genders.put("0", "Female");

            request.setAttribute("genders", genders);
        %>
        Gender:<form:radiobuttons path="gender" items="${genders }"/>
        <br>
        Department:<form:select path="department.id"
                                items="${departments}" itemLabel="departmentName" itemValue="id"/>
        <br>
        Birth:<form:input path="birth" />
        <br>
        <!--
            1. 数据类型转换
            2. 数据类型格式化的问题
            3. 数据校验
        -->
        <input type="submit" value="Submit">
    </form:form>
</body>
</html>
