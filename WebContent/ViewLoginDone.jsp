<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>

<script type="text/javascript">
$('#navigation').load('MenuController');
</script>


<script>
var start = 0;
var nt = 4;
var cview = "GetTweetsFromUser";
var uid = "${user}";

$(document).ready(function(){
	
	$("#duser").load( "GetUserInfo", { user:  uid } ,function() {});
	$("#dtweets").load( "GetTweetsFromUser", { uid: uid, start: start , end: start+nt } ,function() {
		start = nt;
		cview = "GetTweetsFromUser";
	});
	
	/* Infinite scrolling */
	$(window).scroll(function(event) {
		event.preventDefault();
		if(Math.ceil($(window).scrollTop()) == $(document).outerHeight() - $(window).outerHeight()) {
			$.post( cview , { uid: uid, start: start , end: start+nt } , function(data) {
	    	  	$("#dtweets").append(data);
	    		start = start + nt;
	   		});
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
		});
	});
	/* Get and visualize Tweets from a given user */
	$(".vT").click(function(event){
		event.preventDefault();
		$("#dtweets").load( "GetTweetsFromUser", { uid: uid, start: 0 , end: nt } , function(data) {
			start = nt;
			cview = "GetTweetsFromUser";
		});
	});
	/* Get and visualize Tweets from around the world*/
	$(".vW").click(function(event){
		event.preventDefault();
		$("#dtweets").load( "GetTweetsFromUser", { uid: "%", start: 0 , end: nt } , function(data) {
			start = nt;
			cview = "GetTweetsFromUser";
		});
	});
	/* Add tweet and reload Tweet Visualitzation */
	$("#aT").click(function(event){
		event.preventDefault();
		$.post( "AddTweetFromUser", { uid: uid, content: $("#cT").text() } , function(data) {
			$("#dtweets").load( "GetTweetsFromUser", { uid: uid, start: 0 , end: nt } ,function() {
				start = nt;
				cview = "GetTweetsFromUser";
			});
   		});
	});
	
	// Add comment to specific tweet
	$("#cM").click(function(event){
		//System.out.println("CM clicked!");
		event.preventDefault();
		$.post( "AddComment", { uid: uid, content: $("#cT").text(), pid: $(this).parent().attr("id") } , function(data) {
			$("#dtweets").load( "GetTweetsFromUser", { uid: uid, start: 0 , end: nt } ,function() {
				start = nt;
				cview = "GetTweetsFromUser";
			});
   		});
	});
	
	
	
	// ***************************************************************************************************//
	// Elements $("body").on("click","...)  caputure clicks of elements that have been dinamically loaded //
	// ***************************************************************************************************//
	
	/* Delete tweet from user */
	$("body").on("click",".dT",function(event){
		event.preventDefault();
		var tweet = $(this).parent();
		$.post( "DelTweetFromUser", { tid: $(this).parent().attr("id") } , function(data) {
			tweet.remove();
			start = start - 1;
	  	});
	});
	
	/*$("body").on("click", ".cm", function(event){
		event.preventDefault();
		var tweet = $(this).parent();
		$.post()
	});
	*/

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
             <h6 class="w3-opacity"> EPAW template by UPF </h6>
             <p id="cT" contenteditable="true" class="w3-border w3-padding">Status: Feeling EPAW</p>
             <button id="aT" type="button" class="w3-button w3-theme"><i class="fa fa-pencil"></i> &nbsp;Post</button> 
           </div>
         </div>
       </div>
     </div>
     
     <div id="dtweets"> </div>

   <!-- End Middle Column -->
   </div>
 <!-- End Grid -->
 </div>
 