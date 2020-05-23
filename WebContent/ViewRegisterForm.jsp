<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul class="server-errors-list">
<c:if test = "${user.error[0]}">
	<li> Entered user name has been already registered </li>
</c:if>
</ul>

<form action="RegisterController" method="POST">
	<p>      
    <label class="w3-text-red"><b> Username233245345 </b></label>
    <input class="w3-input w3-border w3-light-grey" type="text" name="user" value="${user.user}" required minlength="5" ></p>
    <p>      
    <label class="w3-text-red"><b> Mail address </b></label>
    <input class="w3-input w3-border w3-light-grey" type="email" name="mail" value = "${user.mail}" required></p>
    <p>
    <label class="w3-text-red"><b> Password </b></label>
    <input class="w3-input w3-border w3-light-grey" type="password" id="password" name="password" value = "${user.password}" required></p>
	<p>
    <label class="w3-text-red"><b> Confirm Password </b></label>
    <input class="w3-input w3-border w3-light-grey" type="password" id="pass_confirmation" name="password2" value = "${user.password2}" required></p>
	<p>
    <input class="w3-btn w3-red" type="submit" name="sumbit" value="Submit"></p>
</form>
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