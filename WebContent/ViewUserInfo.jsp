<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="w3-card w3-round w3-white" style="margin-top:16px">
  <div class="w3-container">
   <h4 class="w3-center">My Profile</h4>
   <p class="w3-center"><img src="${user.profilePicture}" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
   <input type="text" class="urlPicture w3-border w3-margin-bottom" maxlength="1000" name="Profile picture" placeholder="URL" required>
   <button type="button" class="changePicture w3-button w3-theme w3-margin-bottom"><i class="fa fa-pencil"></i> &nbsp;Change picture</button>

   <hr>

   <c:if test="${isAdmin}">
      <button type="button" class="dU w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-trash"></i> &nbsp;Delete</button>
   </c:if>
   <input type="text" class="lolusername w3-border w3-margin-bottom" maxlength="24" name="Profile picture" value="${user.lolUsername}" required>
   <input type="text" class="mainchampion w3-border w3-margin-bottom" maxlength="24" name="Profile picture" value="${user.mainChampion}" required>
   <button type="button" class="updateInfo w3-button w3-theme w3-margin-bottom"><i class="fa fa-pencil"></i> &nbsp;Update Info</button>
  </div>
</div>
<br>