<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="w3-card w3-round w3-white" style="margin-top:16px">
  <div class="w3-container">
   <h4 class="w3-center"><span class="uidProfile">${userProfile.user}</span> Profile</h4>
   <p class="w3-center"><img src="${userProfile.profilePicture}" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
   <input type="text" class="urlPicture w3-border w3-margin-bottom" maxlength="1000" name="Profile picture" placeholder="URL" required>
   <button type="button" class="changePicture w3-button w3-theme w3-margin-bottom"><i class="fa fa-pencil"></i> &nbsp;Change picture</button>

   <hr>
   LoL Username
   <input type="text" class="lolusername w3-border w3-margin-bottom" maxlength="24" name="Profile picture" value="${userProfile.lolUsername}" required>
   Main Champion
   <input type="text" class="mainchampion w3-border w3-margin-bottom" maxlength="24" name="Profile picture" value="${userProfile.mainChampion}" required>
   <button type="button" class="updateInfo w3-button w3-theme w3-margin-bottom"><i class="fa fa-pencil"></i> &nbsp;Update Info</button>
   <c:if test="${isAdmin || userProfile.user == user }">
      <button type="button" class="dU w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-trash"></i> &nbsp;Delete</button>
   </c:if>
  </div>
</div>
<br>