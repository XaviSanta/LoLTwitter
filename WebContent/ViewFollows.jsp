<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <div class="w3-row-padding" >
   <div class="w3-col m12">
     <div class="w3-card w3-round w3-white">
       <div class="w3-container w3-padding">
         <h6 class="w3-opacity"> Looking for friends </h6>
         <p id="sf" contenteditable="true" class="w3-border w3-padding">Who do you seek?</p>
         <button id="bf" type="button" class="w3-button w3-theme"><i class="fa fa-pencil"></i> &nbsp;Search</button> 
       </div>
     </div>
   </div>
 </div>
 
 <div id="uInfo"></div>

<c:forEach var="u" items="${users}">       
 <div id="${u.user}" class="sU w3-container w3-card w3-white w3-round w3-margin w3-animate-opacity"><br>
   <img src="w3images/avatar2.png" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
   <h4> ${u.name} </h4><br>
   <button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-trash"></i> &nbsp;Unfollow</button> 
 </div>
</c:forEach>