<%--
  Created by IntelliJ IDEA.
  User: xiangxinli
  Date: 2020/2/27
  Time: 3:23 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Employess</title>
    <script type="text/javascript" src="scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
      $(function(){
        $("#testJson").click(function(){
          var url = this.href;
          var args = {};
          $.post(url, args, function(data){
            for(var i = 0; i < data.length; i++){
              var id = data[i].id;
              var lastName = data[i].lastName;

              alert(id + ": " + lastName);
            }
          });
          return false;
        });
      })
    </script>
  </head>
  <body>
  <a href="emps">List All Employees</a>
  <br><br>
  <a href="testJson" id="testJson">Test Json</a>
  <br><br>
  <a href="testExceptionHandlerExceptionResolver?i=10" >test ExceptionHandlerExceptionResolver</a>
  <br><br>
  <a href="testResponseStatusExceptionResolver?i=10" >test ResponseStatusExceptionResolver</a>
  <br><br>
  <a href="testDefaultHandlerExceptionResolver" >test DefaultHandlerExceptionResolver</a>
  <br><br>
  <a href="testSimpleMappingExceptionResolver?i=2" >test SimpleMappingExceptionResolver</a>
  </body>
</html>
