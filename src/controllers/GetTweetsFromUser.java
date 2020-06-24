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
import models.Tweets;
import models.User;
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
		
		try {
			HttpSession session = request.getSession(false);
			if (session==null || session.getAttribute("user")==null) { // Anonymous user can see up to 20 tweets
				ManageTweets tweetManager = new ManageTweets();
				tweets = tweetManager.getUserTweets("%",0,20);
				tweetManager.finalize();
			} else {
				BeanUtils.populate(dt, request.getParameterMap());
				ManageTweets tweetManager = new ManageTweets();
				tweets = tweetManager.getUserTweets(dt.getUid(),dt.getStart(),dt.getEnd());
				tweetManager.finalize();
				ManageUser muser = new ManageUser();
				String currUser = session.getAttribute("user").toString();
				followings= muser.getUserFollowsString(currUser);
			}
			
			ManageUser userManager = new ManageUser();
			for(int i=0;i<tweets.size();i++) 
			{
				String uid = tweets.get(i).getUid();
				tweets.get(i).setProfilePicture(userManager.getProfilePicture(uid));
				boolean isFollowed = followings.contains(tweets.get(i).getUid());
				tweets.get(i).setIsFollowed(isFollowed);
				//System.out.println(isFollowed);
				//System.out.println(followings.get(0));
			}		
			userManager.finalize();
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}

		
		request.setAttribute("tweets", tweets);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ViewTweetsFromUser.jsp"); 
		dispatcher.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
