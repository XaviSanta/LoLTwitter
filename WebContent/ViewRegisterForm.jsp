<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

  <form action="RegisterController" method="POST" class="login-form">
    <h1>Register</h1>
      <ul class="server-errors-list">
		<c:if test = "${user.error[0]}">
			<p> Entered user name has been already registered </p>
		</c:if>
	  </ul>
    <div class="txtb">
      <input type="text" name="user" value="${user.user}" required minlength="3">
      <span data-placeholder="Username"></span>
    </div>

	<div class="txtb">
      <input  type="email" name="mail" value="${user.mail}" required>
      <span data-placeholder="Email"></span>
    </div>
    
    <div class="txtb focus">
      <input type="password" id="password" name="password" value = "${user.password}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$" title="More than 6 characters with lower, upper caps and numbers.">
      <span data-placeholder="Password"></span>
    </div>
    
    <div class="txtb focus">
      <input type="password" id="pass_confirmation" name="password2" value = "${user.password2}" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$"title="More than 6 characters with lower, upper caps and numbers.">
      <span data-placeholder="Confirm Password"></span>
    </div>

    <input type="submit" class="logbtn" value="Login">

    <div class="bottom-text">
      Already have an account? 
      <a class="menu" id="LoginController" href=# style="color: blue;"><strong>Sign in</strong></a> 
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
<script>
var pass = document.getElementById("password");
var conf = document.getElementById("pass_confirmation");

pass.onchange = validatePassword;
conf.onkeyup = validatePassword;

function validatePassword() {
	if (pass.value !== conf.value) {
		conf.setCustomValidity("Passwords Don't Match");
	} else {
		conf.setCustomValidity('');
	}
}
</script>