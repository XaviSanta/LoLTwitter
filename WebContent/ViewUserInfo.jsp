<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="w3-card w3-round w3-white" style="margin-top:16px">
  <div class="w3-container">
   <h4 class="w3-center">My Profile</h4>
   <p class="w3-center"><img src='${user.profilePicture}' class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
   <hr>
   <p id="uid"><i class="fa fa-id-card fa-fw w3-margin-right w3-text-theme"></i> ${user.user} </p>
   <p id="name"><i class="fa fa-id-badge fa-fw w3-margin-right w3-text-theme"></i> ${user.user} </p>
  </div>
</div>
<br>