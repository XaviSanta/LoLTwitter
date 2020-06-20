package controllers;

import java.io.Console;
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
import models.alikModel;

/**
 * Servlet implementation class CommentTweet
 */
@WebServlet("/CommentTweet")
public class CommentTweet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentTweet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 alikModel alikm = new alikModel();

	        try {
	            BeanUtils.populate(alikm, request.getParameterMap());
	            //System.out.println(alikm.getTid());
	            System.out.println(alikm.getUid());
	            ManageTweets tweetManager = new ManageTweets();
	            //likeManager.addLike(alikm.getTid(), alikm.getUid(), new Timestamp(System.currentTimeMillis()));
	            //likeManager.finalize();
	            tweetManager.addComment(alikm.getUid(), new Timestamp(System.currentTimeMillis()), alikm.getComment(), alikm.getTid());

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
