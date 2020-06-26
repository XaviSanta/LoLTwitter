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

import managers.ManageLike;
import managers.ManageTweets;
import models.alikModel;

/**
 * Servlet implementation class AddLikeFromUser
 */
@WebServlet("/AddLikeFromUser")
public class AddLikeFromUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLikeFromUser() {
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
			ManageLike likeManager = new ManageLike();
			ManageTweets manageTweet = new ManageTweets();
			
			boolean succes = likeManager.addLike(alikm.getTid(), alikm.getUid(), new Timestamp(System.currentTimeMillis()));
			if(succes) {
				manageTweet.likeTweet(alikm.getTid());
			} else {
				likeManager.deleteUserLike(alikm.getUid(), alikm.getTid());
				manageTweet.dislikeTweet(alikm.getTid());
			}
			likeManager.finalize();
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
