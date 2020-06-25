<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

<script type="text/javascript">
$('#navigation').load('MenuController');
</script>

<script>
var start = 0;
var nt = 8;
var cview = "GetTweetsFromUser";
var uid = "${user}";
var userViewing = "";
$(document).ready(function(){
	
	$("#duser").load( "GetUserInfo", { user:  uid } ,function() {});
	$("#dtweets").load( "GetTweetsFromUser", { uid: uid, start: start , end: start+nt } ,function() {
		start = nt;
		cview = "GetTweetsFromUser";
	});
	
	/* Infinite scrolling */
	$(window).scroll(function(event) {
		event.preventDefault();
		if(cview !=="GetTweetInfoController"){			
			if(Math.ceil($(window).scrollTop()) == $(document).outerHeight() - $(window).outerHeight()) {
				$.post( cview , { uid: userViewing, start: start , end: start+nt } , function(data) {
		    		$("#dtweets").append(data);
		    		start = start + nt;
				});
			}
		}
	});
	
	// *******************************************************************************************//
	// Elements $("#id").click(...)  caputure clicks of elements that have been statically loaded //
	// *******************************************************************************************//
	
	/* Get and visualize user follows*/
	$(".vF").click(function(event){
		event.preventDefault();
		$("#dtweets").load( "GetFollows", { uid: uid, start: 0 , end: nt } , function(data) {
			start = nt;
			cview = "GetFollows";
			userViewing = uid;
			var profileUser = $('#duser').find(".uidProfile:first").text();
			if(uid !== profileUser) {
				$('#duser').load("GetUserInfo", { user: uid } ,function() {});
			}
		});
	});
	/* Get and visualize Tweets from a given user */
	$(".vT").click(function(event){
		event.preventDefault();
		$("#dtweets").load( "GetTweetsFromUser", { uid: uid, start: 0 , end: nt } , function(data) {
			start = nt;
			cview = "GetTweetsFromUser";
			userViewing = uid;
		});
	});
	/* Get and visualize Tweets from followings */
	$(".vFT").click(function(event){
		event.preventDefault();
		$("#dtweets").load( "GetTweetsFromFollowings", { uid: uid, start: 0 , end: nt } , function(data) {
			var profileUser = $('#duser').find(".uidProfile:first").text();
			if(uid !== profileUser) {
				$('#duser').load("GetUserInfo", { user: uid } ,function() {});
			}
			start = nt;
			cview = "GetTweetsFromFollowings";
			userViewing = uid;
		});
	});
	/* Get and visualize Tweets from around the world*/
	$(".vW").click(function(event){
		event.preventDefault();
		$("#dtweets").load( "GetTweetsFromUser", { uid: "%", start: 0 , end: nt } , function(data) {
			start = nt;
			cview = "GetTweetsFromUser";
			userViewing = "%";
			var profileUser = $('#duser').find(".uidProfile:first").text();
			if(uid !== profileUser) {
				$('#duser').load("GetUserInfo", { user: uid } ,function() {});
			}
		});
	});
	/* Add tweet and reload Tweet Visualitzation */
	$("#aT").click(function(event){
		event.preventDefault();
		var content = $("#cT").text();
		content = substituteYTRef(content);
		$.post( "AddTweetFromUser", { uid: uid, content: content } , function(data) {
			$("#dtweets").load( "GetTweetsFromUser", { uid: uid, start: 0 , end: nt } ,function() {
				start = nt;
				cview = "GetTweetsFromUser";
				userViewing = uid;
			});
		});
	});
	

	/* add link tweet */
	$("#YouTubeLink").click(function(event){
		event.preventDefault();
		var content = $("#cT").text() + ' [YT]  [\\YT]'
		$("#cT").text(content);
	});
	function substituteYTRef(content) {
		var openTag = '[YT]';
		var closingTag = '[\\YT]';
		var i = content.indexOf(openTag);
		var j = content.indexOf(closingTag);
		if(i === -1 || j === -1) return content;
		var pre = content.substring(0,i);
		var link = content.substring(i + openTag.length, j);
		var post = content.substring(j + closingTag.length);
		var encodedTweet = '<iframe width="100%" height="500" src="' + 
			'https://www.youtube.com/embed/' +
			ytParser(link) + 
			'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
	
		return pre + encodedTweet + post;
	}
	function ytParser(url) {
		var regExp = /^.*(youtu\.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
		var match = url.match(regExp);
		if (match && match[2].length == 11) {
		  return match[2];
		} else {
		  //error
		}
	}
	// ***************************************************************************************************//
	// Elements $("body").on("click","...)  caputure clicks of elements that have been dinamically loaded //
	// ***************************************************************************************************//
	
	/* go to user perfil */
	$("body").on("click", ".perfil", function(event){
		event.preventDefault();
		var tweet = $(this).parent();
		var target_user = tweet.attr("uid");
		goToProfile(target_user);
	});
	
	
	/* go to user perfil from follows*/
	$("body").on("click", ".perfilFollows", function(event){
		event.preventDefault();
		var profile = $(this).parent();
		var target_user = profile.find(".perfilFollows").text();
		goToProfile(target_user);
	});
	
	function goToProfile(target_user) {
		userViewing = target_user;
      	$("#dtweets").load( "GetTweetsFromUser", { uid: target_user, start: 0 , end: nt } ,function() {
			start = nt;
			cview = "GetTweetsFromUser";
		});
      	$("#duser").load( "GetUserInfo", { user: target_user } ,function() {
		});
	}
	
	/* Delete tweet from user */
	$("body").on("click",".dT",function(event){
		event.preventDefault();
		var tweet = $(this).parent();
		$.post( "DelTweetFromUser", { tid: $(this).parent().attr("id") } , function(data) {
			tweet.remove();
			start = start - 1;
		});
	});
	
	/* Delete User if admin */
	$("body").on("click", ".dU", function(event){
		event.preventDefault();
		var profile = $(this).parent();
		var uidProfile = profile.find(".uidProfile:first").text();
		$.post( "DelUser", { user: uidProfile }, function(){
			if(uidProfile == uid){
				$('#navigation').load('LogoutController', function(){
					location.reload();
				});
			}
			else{
				$('#duser').load("GetUserInfo", { user: uid } ,function() {
					cview = "GetUserInfo";
				});
	        	$("#dtweets").load( "GetTweetsFromUser", { uid: uid, start: 0 , end: nt } ,function() {
					start = nt;
					cview = "GetTweetsFromUser";
				});
			}
		});
		
	});
	
	$("body").on("click",".bf", function(event){
		event.preventDefault();
		$.post( "GetUserInfo", {user: $("#sf").text() } , function(data){
		});
	});
	
	//add likes:
	$("body").on("click",".alik",function(event){
		event.preventDefault();
		var tweet = $(this).parent();
		var likeb = $(this);
		var temp = $('#duser').find(".uidProfile:first").text();
		var likeSpan = tweet.find(".nLikes:first");
		nLikes = likeSpan.text();
		console.log(nLikes);
		likeb.attr('disabled', 'disabled');
		$.post( "AddLikeFromUser", {tid: $(this).parent().attr("id"), uid: uid } , function(data) {
			likeSpan.text(+nLikes+1);
		});
		

	});

	// Follow user
	$("body").on("click",".follow",function(event){
		event.preventDefault();
		var followBtn = $(this);
		var tweet = $(this).parent();
		$.post( "FollowUserController", {uid:uid, fid:tweet.attr("uid")} , function(data) {
			followBtn.hide();
		});
	});
	
	// Follow user
	$("body").on("click",".unfollow",function(event){
		event.preventDefault();
		var user = $(this).parent();
		
		$.post( "UnfollowUserController", {uid:uid, fid:user.attr("id")} , function(data) {
			user.remove();
			start = start - 1;
		});
	});
	
	/* Update Profile picture */
	$("body").on("click",".changePicture",function(event){
		event.preventDefault();
		var url = $(this).parent().find("input").val();
		$.post( "SetProfilePictureController", { profilePicture: url, user:uid} , function(data) {
			$("#duser").load( "GetUserInfo", { user: uid } ,function() {
				cview = "GetUserInfo";
			});
		});
	});
	/* Update user info */
	$("body").on("click",".updateInfo",function(event){
		event.preventDefault();
		var lolUsername = $(this).parent().find(".lolusername").val();
		var mainChampion = $(this).parent().find(".mainchampion").val();
		var userId = $(this).parent().find(".uidProfile").text();
		$.post( "SetProfileInfoController", { user:userId, lolUsername:lolUsername, mainChampion:mainChampion} , function(data) {
			$("#duser").load( "GetUserInfo", { user: userId } ,function() {
				cview = "GetUserInfo";
			});
		});
	});
	
	/* Open Edit Tweet */
	$("body").on("click",".editTw",function(event){
		event.preventDefault();
		var tweet = $(this).parent();
		var inputBoxEdit = tweet.find(".underTwEdit:first");
		var inputBoxReply = tweet.find(".underTwReply:first");
		if (inputBoxEdit.is(':visible')){
			inputBoxEdit.hide();
		} else {		
			inputBoxEdit.show();
			inputBoxReply.hide();
		}
	});
	/* Edit Tweet */
	$("body").on("click",".editPostBtn",function(event){
		event.preventDefault();
		var underTweet = $(this).parent();
		var tweet = underTweet.parent();
		var tid = tweet.attr("id");
		var content = underTweet.find(".contentUnderTweet").text();
		var inputBox = tweet.find(".underTwEdit");
		var contentP = tweet.find(".contentT:first");
		console.log(inputBox);
		$.post( "EditTweetController", { content:content, tid:tid} , function(data) {
			contentP.text(content);
			inputBox.hide();
		});
	});
	
	/* Open Reply Tweet */
	$("body").on("click",".replyTw",function(event){
		event.preventDefault();
		var underTweet = $(this).parent();
		var inputBoxReply = underTweet.find(".underTwReply:first");
		var inputBoxEdit = underTweet.find(".underTwEdit:first");
		if (inputBoxReply.is(':visible')){
			inputBoxReply.hide();
		} else {		
			inputBoxReply.show();
			inputBoxEdit.hide();
		}
	});
	/* Reply Tweet */
	$("body").on("click",".replyPostBtn",function(event){
		event.preventDefault();
		var underTweet = $(this).parent();
		var tweet = underTweet.parent();
		var tid = tweet.attr("id");
		var content = underTweet.find(".contentReply").text();
		var inputBox = underTweet.find(".underTwReply:first");
		var profileUser = $('#duser').find(".uidProfile:first").text();
		
        $.post( "CommentTweet", {tid: tid, uid:uid, content: content } , function(data) {  
			$("#dtweets").load( "GetTweetInfoController", { tid: tid } ,function() {
				cview = "GetTweetInfoController";
			});
       	});
	});
	
	/* Show Tweet + Replies */
	$("body").on("click",".tweetResponse",function(event){
		event.preventDefault();
		var tid = $(this).attr('pid');
        $("#dtweets").load( "GetTweetInfoController", { tid: tid } ,function() {
			cview = "GetTweetInfoController";
		});
	});
	/* Show Tweet + Replies */
	$("body").on("click",".tweetId",function(event){
		event.preventDefault();
		var tid = $(this).attr('tid');
        $("#dtweets").load( "GetTweetInfoController", { tid: tid } ,function() {
			cview = "GetTweetInfoController";
		});
	});
	
});
</script>

 <!-- The Grid -->
 <div class="w3-row">
 
   <!-- Left Column -->
   <div class="w3-col m3">
     
     <!-- Profile -->
     <div id="duser"> </div>
   <!-- End Left Column -->
   </div>
   
   <!-- Middle Column -->
   <div class="w3-col m9">
   
     <div class="w3-row-padding" >
       <div class="w3-col m12">
         <div class="w3-card w3-round w3-white">
           <div class="w3-container w3-padding">
             <h6 class="w3-opacity"> Publish a tweet </h6>
             <p id="cT" contenteditable="true" class="w3-border w3-padding"></p>
             <button id="YouTubeLink" class="w3-button w3-theme"><i class="fa fa-youtube"></i></button>
             <button id="aT" type="button" class="w3-button w3-theme"><i class="fa fa-paper-plane"></i> &nbsp;Post</button> 
           </div>
         </div>
       </div>
     </div>
     
     <div id="dtweets"> </div>

   <!-- End Middle Column -->
   </div>
 <!-- End Grid -->
 </div>