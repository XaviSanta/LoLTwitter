<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <div 
	id="${tweet.tid}" 
	uid="${tweet.uid}"
	class="w3-container w3-card w3-white w3-round w3-margin w3-animate-opacity">
	 
	<br>
	<img src="${tweet.profilePicture}" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
	<span class="w3-right w3-opacity"> ${tweet.postDateTime} </span>
	<button class="perfil" style="background:none;border:none;font-weight:bold;font-size:large;height:50px"> ${tweet.uid} </button>
	<span tid="${tweet.tid}" class="hoverB tweetId" style="color:gray">#${tweet.tid}</span>
	<c:if test="${tweet.pid!=0}">
		<p pid="${tweet.pid}" class="parentContent tweetResponse hoverB" style="color:gray">Reply to <strong>${tweet.uid}</strong>'s tweet \#${tweet.pid}</p> 
	</c:if>
	<c:if test="${user != null && tweet.uid != user && !tweet.isFollowed}">
		<button type="button" class="follow w3-theme-d1"><i class="fa fa-user-plus"></i>&nbsp;Follow</button> 
	</c:if>
	<hr class="w3-clear">
	<p class="contentT"> ${tweet.content} </p>
	<c:if test="${tweet.isLikedByMe}">
		<button type="button" class="alik w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-heart" style="color:red"></i>&nbsp;
			<span class="nLikes">${tweet.likes}</span>
		</button>
	</c:if>
	<c:if test="${!tweet.isLikedByMe}">
		<button type="button" class="alik w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-heart" ></i>&nbsp;
			<span class="nLikes">${tweet.likes}</span>
		</button>
	</c:if> 
	<c:if test="${user != null}">
		<c:if test="${isAdmin || t.uid == user}">
			<button type="button" class="dT w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-trash"></i> &nbsp;Delete</button>
			<button type="button" class="editTw w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-pencil"></i> &nbsp;Edit</button>
		</c:if>
		<button type="button" class="replyTw w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-reply"></i> &nbsp;Reply</button>
	</c:if>
	
	<div class="underTwEdit" style="display:none">
		<hr class="w3-clear">
		<p contenteditable="true" class="contentUnderTweet w3-border w3-padding"></p>
	       <button type="button" class="editPostBtn w3-button w3-theme"><i class="fa fa-paper-plane"></i> &nbsp;Edit</button> 
	</div>
	
	<div class="underTwReply" style="display:none">
		<hr class="w3-clear">
		<p contenteditable="true" class="contentReply w3-border w3-padding"></p>
	       <button type="button" class="replyPostBtn w3-button w3-theme"><i class="fa fa-paper-plane"></i> &nbsp;Reply</button> 
	</div>
	<br>
	<c:forEach var="r" items="${replies}">  
	  <div 
		id="${r.tid}"
		uid="${r.uid}"
		class="w3-container w3-card w3-white w3-round w3-margin w3-animate-opacity">
		 
		<br>
		<img src="${r.profilePicture}" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:60px">
		<span class="w3-right w3-opacity"> ${r.postDateTime} </span>
		<button class="perfil" style="background:none;border:none;font-weight:bold;font-size:large"> ${r.uid} </button>
		<span tid="${r.tid}" class="hoverB tweetId" style="color:gray">#${r.tid}</span>
		<c:if test="${r.pid!=0}">
			<p pid="${r.pid}" class="parentContent tweetResponse hoverB" style="color:gray">Reply \#${r.pid}</p> 
		</c:if>
		<c:if test="${user != null && r.uid != user && !r.isFollowed}">
			<button type="button" class="follow w3-theme-d1"><i class="fa fa-user-plus"></i>&nbsp;Follow</button> 
		</c:if>
		<hr class="w3-clear">
		<p class="contentT"> ${r.content} </p>
			<c:if test="${r.isLikedByMe}">
		<button type="button" class="alik w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-heart" style="color:red"></i>&nbsp;
			<span class="nLikes">${r.likes}</span>
		</button>
		</c:if>
		<c:if test="${!r.isLikedByMe}">
			<button type="button" class="alik w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-heart" ></i>&nbsp;
				<span class="nLikes">${r.likes}</span>
			</button>
		</c:if> 
		<c:if test="${user != null}">
			<c:if test="${isAdmin || r.uid == user}">
				<button type="button" class="dT w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-trash"></i> &nbsp;Delete</button>
				<button type="button" class="editTw w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-pencil"></i> &nbsp;Edit</button>
			</c:if>
			<button type="button" class="replyTw w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-reply"></i> &nbsp;Reply</button>
		</c:if>
		
		<div class="underTwEdit" style="display:none">
			<hr class="w3-clear">
			<p contenteditable="true" class="contentUnderTweet w3-border w3-padding"></p>
	        <button type="button" class="editPostBtn w3-button w3-theme"><i class="fa fa-paper-plane"></i> &nbsp;Edit</button> 
		</div>
		
		<div class="underTwReply" style="display:none">
			<hr class="w3-clear">
			<p contenteditable="true" class="contentReply w3-border w3-padding"></p>
	        <button type="button" class="replyPostBtn w3-button w3-theme"><i class="fa fa-paper-plane"></i> &nbsp;Reply</button> 
		</div>
	 </div>
	</c:forEach>
</div>

