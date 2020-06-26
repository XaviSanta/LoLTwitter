package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import managers.ManageLike;
import managers.ManageTweets;
import managers.ManageUser;
import models.Tweets;

/**
 * Servlet implementation class dTcontroller
 */
@WebServlet("/GetTweetInfoController")
public class GetTweetInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTweetInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Tweets tweet = new Tweets();
		List<Tweets> replies = Collections.emptyList();
		ManageUser userManager = new ManageUser();
		List<String> followings =  Collections.emptyList();
		List<Integer> likes =  Collections.emptyList();
		try {
			BeanUtils.populate(tweet, request.getParameterMap());
			ManageTweets tweetManager = new ManageTweets();
			tweet = tweetManager.getTweet(tweet.getTid());
			tweet.setProfilePicture(userManager.getProfilePicture(tweet.getUid()));
			
			replies = tweetManager.getReplies(tweet.getTid());
			tweetManager.finalize();
			
			HttpSession session = request.getSession(false);
			String currUser = session.getAttribute("user").toString();
			followings= userManager.getUserFollowsString(currUser);
			tweet.setIsFollowed(followings.contains(tweet.getUid()));
			
			ManageLike likeManager = new ManageLike();
			likes = likeManager.getLikes(currUser);
			tweet.setIsLikedByMe(likes.contains(tweet.getTid()));
			for(int i=0;i<replies.size();i++) 
			{
				String uid = replies.get(i).getUid();
				replies.get(i).setProfilePicture(userManager.getProfilePicture(uid));
				boolean isFollowed = followings.contains(replies.get(i).getUid());
				replies.get(i).setIsFollowed(isFollowed);
				
				boolean isLiked = likes.contains(replies.get(i).getTid());
				replies.get(i).setIsLikedByMe(isLiked);
			}
			
			userManager.finalize();
			
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}

		request.setAttribute("tweet", tweet);
		request.setAttribute("replies", replies);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ViewTweetReplies.jsp"); 
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
