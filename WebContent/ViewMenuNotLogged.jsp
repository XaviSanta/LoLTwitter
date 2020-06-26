<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    
    
<link rel="stylesheet" href="./css/menu.css">
 
<div class="w3-bar w3-cyan">

	<a class="w3-bar-item w3-button" id="LoginController" href="MainController" title="Profile"><img src="images/logo.png" class="w3-circle " width="50" height="50"></a>
	<div></div>
	<a class="menu-bt menu w3-bar-item w3-button w3-hide-small w3-hover-white  w3-card-4 w3-border" id="RegisterController" href=#> Registration </a> 
	<a class="menu-bt menu w3-bar-item w3-button w3-hide-small w3-hover-white  w3-card-4 w3-border" id="LoginController" href=#> Login </a> 
	<a class="menu-bt menu w3-bar-item w3-button w3-hide-small w3-hover-white  w3-card-4 w3-border" id="GetTweetsFromUser" href=#> Explore </a> 
	<a href="javascript:void(0)" class="w3-bar-item w3-button menu-bt w3-right w3-hide-large w3-hide-medium" onclick="stack()">&#9776;</a>
</div>




<div id="stack" class="w3-bar-block w3-cyan w3-hide w3-hide-large w3-hide-medium">
	<a class="menu w3-bar-item w3-button w3-card-4" id="RegisterController" href=#> Registration </a> 
	<a class="menu w3-bar-item w3-button w3-card-4" id="LoginController" href=#> Login </a> 
	<a class="menu w3-bar-item w3-button w3-card-4" id="GetTweetsFromUser" href=#> Explore </a> 
</div>
