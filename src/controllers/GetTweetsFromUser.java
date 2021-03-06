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

import managers.ManageTweets;
import managers.ManageUser;
import managers.ManageLike;
import models.Tweets;
import models.dTmodel;

/**
 * Servlet implementation class dTcontroller
 */
@WebServlet("/GetTweetsFromUser")
public class GetTweetsFromUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTweetsFromUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		dTmodel dt = new dTmodel();
		List<Tweets> tweets = Collections.emptyList();
		List<String> followings =  Collections.emptyList();
		List<Integer> likes =  Collections.emptyList();
		String view = "ViewTweetsFromUser.jsp";
		try {
			HttpSession session = request.getSession(false);
			BeanUtils.populate(dt, request.getParameterMap());
			if (session==null || session.getAttribute("user")==null) {
				ManageTweets tweetManager = new ManageTweets();
				if(dt.getUid() == null) {
					tweets = tweetManager.getUserTweets("%",0,20);
				} else {
					tweets = tweetManager.getUserTweets(dt.getUid(),0,20);
				}
				tweetManager.finalize();
				view = "ViewFromAnon.jsp";
			} else {
				
				ManageTweets tweetManager = new ManageTweets();
				tweets = tweetManager.getUserTweets(dt.getUid(),dt.getStart(),dt.getEnd());
				tweetManager.finalize();
				ManageUser muser = new ManageUser();
				String currUser = session.getAttribute("user").toString();
				followings= muser.getUserFollowsString(currUser);
				ManageLike likeManager = new ManageLike();
				likes = likeManager.getLikes(currUser);
			}
			
			ManageUser userManager = new ManageUser();
			for(int i=0;i<tweets.size();i++) 
			{
				String uid = tweets.get(i).getUid();
				tweets.get(i).setProfilePicture(userManager.getProfilePicture(uid));
				boolean isFollowed = followings.contains(tweets.get(i).getUid());
				tweets.get(i).setIsFollowed(isFollowed);
				boolean isLiked = likes.contains(tweets.get(i).getTid());
				tweets.get(i).setIsLikedByMe(isLiked);
			}		
			userManager.finalize();
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}

		
		request.setAttribute("tweets", tweets);
		RequestDispatcher dispatcher = request.getRequestDispatcher(view); 
		dispatcher.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
