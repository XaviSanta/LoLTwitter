<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>



<link rel="stylesheet" href="./css/opgg.css">
 
<div class="w3-bar w3-cyan" >
	<a class="w3-bar-item w3-button" id="LogoutController" href="MainController" title="Profile"><img src="images/logo.png" class="w3-circle " width="50" height="50"></a>
	<div>&nbsp;</div>
	<a class="w3-bar-item w3-hover-white w3-button  w3-card-4 w3-border" id="LogoutController" href="MainController" title="Profile" style="width:7%;border-radius: 12px;"> <i class="fa fa-user" aria-hidden="true"></i> </a>
	<a href="#" class="vFT w3-bar-item w3-button w3-hide-small w3-hover-white  w3-border w3-card-4" title="Home" style="width:7%;border-radius: 12px;margin-left:1%" ><i class="fa fa-home"></i></a>
	<a href="#" class="vF w3-bar-item w3-button w3-hide-small w3-hover-white w3-border w3-card-4" title="Friends" style="width:7%;border-radius: 12px;margin-left:1%"><i class="fa fa-users"></i></a>
	<a href="#" class="vW w3-bar-item w3-button w3-hide-small w3-hover-white w3-border w3-card-4" title="Explore" style="width:7%;border-radius: 12px;margin-left:1%;"><i class="fa fa-globe"></i></a>
	<a class="menu w3-bar-item w3-button w3-hide-small w3-right" id="LogoutController" href=#> Logout </a>
	<a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="stack()">&#9776;</a>
	
</div>



<div id="stack" class="w3-bar-block w3-indigo w3-hide w3-hide-large w3-hide-medium">
	<a class="vFT w3-bar-item w3-button" href=#> Feed </a>
	<a class="vF w3-bar-item w3-button" href=#> Friends </a>
	<a class="vW w3-bar-item w3-button" href=#> Explore </a>
	<a class="menu w3-bar-item w3-button" id="LogoutController" href=#> Logout </a>
</div>
