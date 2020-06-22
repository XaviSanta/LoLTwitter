<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:forEach var="t" items="${tweets}">  
  <div 
	id="${t.tid}" 
	uid="${t.uid}"
	class="w3-container w3-card w3-white w3-round w3-margin w3-animate-opacity">
	 
	<br>
	<img src="${t.profilePicture}" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
	<span class="w3-right w3-opacity"> ${t.postDateTime} </span>
	<button class="perfil" style="background:none;border:none;font-weight:bold;font-size:large"> ${t.uid} </button>
	<span style="color:gray">#${t.tid}</span>
	<c:if test="${t.pid!=0}">
		<p class="parentContent">Tweet in response to ${t.uid}'s tweet \#${t.pid}</p> 
	</c:if>
	<c:if test="${user != null && t.uid != user}">
		<button type="button" class="follow w3-theme-d1"><i class="fa fa-user-plus"></i>&nbsp;Follow</button> 
	</c:if>
	<hr class="w3-clear">
	<p> ${t.content} </p>
	<button type="button" class="alik w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>&nbsp;<span> ${t.likes} </span></button> 
	<c:if test="${user != null}">
		<c:if test="${isAdmin || t.uid == user}">
			<button type="button" class="dT w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-trash"></i> &nbsp;Delete</button>
		</c:if>
		<input type="text" class="cM w3-border w3-padding w3-margin-bottom" maxlength="1000" name="comment" placeholder="Write comment" required>
		<button type="button" class="comment w3-button w3-theme w3-margin-bottom"><i class="fa fa-pencil"></i> &nbsp;Post Comment</button>
	</c:if>

 </div>
</c:forEach>
