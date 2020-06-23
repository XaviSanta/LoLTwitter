<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:forEach var="u" items="${users}">       
 <div id="${u.uid}" class="w3-container w3-card w3-white w3-round w3-margin w3-animate-opacity"><br>
   <img src="https://www.w3schools.com/w3images/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
	
	<button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-trash"></i> &nbsp;Follow</button> 

 </div>

</c:forEach>