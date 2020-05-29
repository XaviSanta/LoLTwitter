<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <form action="LoginController" method="POST" class="login-form">
    <h1>Login</h1>
      <ul class="server-errors-list">
        <c:if test="${login.error}">
          <p> Incorrect username or password </p>
        </c:if>
      </ul>
    <div class="txtb">
      <input type="text" name="user" value="${login.user}" required minlength="3">
      <span data-placeholder="Username"></span>
    </div>

    <div class="txtb focus">
      <input type="password" name="password" value="${login.password}" required>
      <span data-placeholder="Password"></span>
    </div>

    <input type="submit" class="logbtn" value="Login">

    <div class="bottom-text">
      Don't have account? 
      <a class="menu" id="RegisterController" href=# style="color: blue;"><strong>Sign up </strong></a> 
    </div>

    
  </form>

  <script type="text/javascript">
    $(".txtb input").each(function () {
      if($(this).val()) {
        $(this).addClass("focus");
      }
    });

    $(".txtb input").on("focus", function () {
      $(this).addClass("focus");
    });

    $(".txtb input").on("blur", function () {
      if ($(this).val() == "")
        $(this).removeClass("focus");
    });
  </script>