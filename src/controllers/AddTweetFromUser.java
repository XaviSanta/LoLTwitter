package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import managers.ManageTweets;
import models.Tweets;

/**
 * Servlet implementation class AddTweetFromUser
 */
@WebServlet("/AddTweetFromUser")
public class AddTweetFromUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTweetFromUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Tweets tweet = new Tweets();

		try {
			BeanUtils.populate(tweet, request.getParameterMap());
			ManageTweets tweetManager = new ManageTweets();
			tweetManager.addTweet(tweet.getUid(),  new Timestamp(System.currentTimeMillis()), tweet.getContent());
			tweetManager.finalize();

		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
