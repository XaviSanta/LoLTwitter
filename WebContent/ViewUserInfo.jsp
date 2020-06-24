<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="./css/opgg.css">
<div class="w3-card w3-round w3-white" style="margin-top:16px">
  <div class="w3-container">
   <h4 class="w3-center"><span onClick="openOpgg()" class="opGG uidProfile">${userProfile.user}</span> Profile</h4>
   
   <p class="w3-center"><img onClick="openOpgg()" src="${userProfile.profilePicture}" class="w3-circle opGG" style="height:106px;width:106px" alt="Avatar"></p>
   <c:if test="${isAdmin || userProfile.user == user }">
	   <input type="text" class="urlPicture w3-border w3-margin-bottom" maxlength="1000" name="Profile picture" placeholder="URL" required>
	   <button type="button" class="changePicture w3-button w3-theme w3-margin-bottom"><i class="fa fa-pencil"></i> &nbsp;Change picture</button>
   </c:if>
   
   <hr>
   
   <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32">
	 <path onClick="openOpgg()" class="opGG" data-arg1='1234' fill="#000" d="M9.575 5.333c-.183 0-.351.104-.433.268-.083.165-.065.361.045.508l1.358 1.81V24.08l-1.842 1.81c-.11.147-.128.343-.046.508.082.164.25.268.433.268h14.061c.147 0 .287-.067.379-.182l2.424-2.424c.116-.146.138-.345.057-.513-.08-.168-.25-.275-.436-.275H15.393V5.818c0-.268-.217-.485-.484-.485H9.575zm6.788 1.94v.97c4.812 0 8.727 3.915 8.727 8.727 0 2.009-.689 3.856-1.834 5.333h1.197c1.05-1.58 1.608-3.436 1.607-5.333 0-5.347-4.35-9.697-9.697-9.697zm0 1.94v13.09h5.62c1.321-1.391 2.138-3.267 2.138-5.333 0-4.278-3.48-7.758-7.758-7.758zm-6.788.843c-1.675 1.645-2.76 3.89-2.894 6.386-.025.46-.017.92.023 1.377.206 2.366 1.268 4.49 2.871 6.065v-1.442c-1.255-1.547-1.94-3.48-1.94-5.472 0-1.993.685-3.925 1.94-5.473v-1.441zm0 3.166c-.637 1.147-.97 2.436-.97 3.748 0 1.358.354 2.635.97 3.747v-7.495z"/>
   </svg>

   <c:if test="${!isAdmin && userProfile.user != user }">
      <span onClick="openOpgg()" class="opGG">LoL Username </span>
      <p  class="w3-border w3-margin-bottom">${userProfile.lolUsername}</p>
      Main Champion
      <p  class="w3-border w3-margin-bottom">${userProfile.mainChampion}</p>
   </c:if>
   <c:if test="${isAdmin || userProfile.user == user }">
      <span onClick="openOpgg()" class="opGG">LoL Username </span>
      <input type="text" class="lolusername w3-border w3-margin-bottom" maxlength="24" value="${userProfile.lolUsername}" required>
      Main Champion
      <input type="text" class="mainchampion w3-border w3-margin-bottom" maxlength="24" value="${userProfile.mainChampion}" required>
      <button type="button" class="updateInfo w3-button w3-theme w3-margin-bottom"><i class="fa fa-pencil"></i> &nbsp;Update Info</button>
      
      <hr>
      
      <button type="button" class="dU w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-trash"></i> &nbsp;Delete</button>
   </c:if>
  </div>
</div>
<br>

   <script>
   	function openOpgg() {
   		var lolusername = $('.lolusername').val();
   		window.open("https://euw.op.gg/summoner/userName="+lolusername);
   	}
   </script>