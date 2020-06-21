<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:forEach var="t" items="${tweets}">       
  <div 
    id="${t.tid}" 
    uid="${t.uid}"
    class="w3-container w3-card w3-white w3-round w3-margin w3-animate-opacity">
     
    <br>
   
    <img src="https://www.w3schools.com/w3images/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
    <span class="w3-right w3-opacity"> ${t.postDateTime} </span>
    <h4> ${t.uid} </h4>
    <c:if test="${t.pid}">
    	<p>Mierda</p> 
    </c:if>
    <c:if test="${t.uid != user}">
    	<button type="button" class="follow w3-theme-d1"><i class="fa fa-user-plus"></i>&nbsp;Follow</button> 
    </c:if>
    <br>
   
    <hr class="w3-clear">
    <p> ${t.content} </p>
	<button type="button" class="alik w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>&nbsp;<span> ${t.likes} </span></button> 
  <button type="button" class="dT w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-trash"></i> &nbsp;Delete</button>
  <p id="cM" contenteditable="true" class="w3-border w3-padding">EPAW</p>
  <button type="button" class="comment w3-button w3-theme"><i class="fa fa-pencil"></i> &nbsp;Post Comment</button>
 </div>
</c:forEach>
