<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<ul class="server-errors-list">
<c:if test = "${login.error}">
	<li> Incorrect username or password </li>
</c:if>
</ul>

<form action="LoginController" method="POST">
	<p>      
    <label class="w3-text-red"><b> Username </b></label>
    <input class="w3-input w3-border w3-light-grey" type="text" name="user" value="${login.user}" required minlength="5" ></p>
    <p>      
    <label class="w3-text-red"><b> Password </b></label>
    <input class="w3-input w3-border w3-light-grey" type="password" name="password" value="${login.password}" required ></p>
    <p>
    <input class="w3-btn w3-red" type="submit" name="sumbit" value="Submit"></p>
</form>
