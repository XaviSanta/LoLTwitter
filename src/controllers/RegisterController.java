package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import managers.ManageUser;
import models.User;

/**
 * Servlet implementation class FormController
 */
@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	   System.out.print("RegisterController: ");
	   String view = "ViewRegisterForm.jsp";
	   try {
		   User user = new User();
		   ManageUser manager = new ManageUser();
		   BeanUtils.populate(user, request.getParameterMap());
		   if (manager.isComplete(user)) {
			   if(manager.isUsernameAvailable(user)) {
				   if(manager.addUser(user)) {
					   manager.finalize();
					   System.out.println(" user ok, forwarding to ViewLoginForm");
					   HttpSession session = request.getSession();
					   session.setAttribute("user", user.getUser());
					   view = "ViewLoginDone.jsp";
				   }
				   else {
					   System.out.println("error forwarding to ViewRegisterForm");
					   request.setAttribute("user",user);
				   }
			   } else {
				   System.out.println(" user exists, forwarding to ViewRegisterForm");
				   user.setError(0, true);
				   request.setAttribute("user",user);
			   }
		   } 
		   else {
			   System.out.println(" forwarding to ViewRegisterForm");
			   request.setAttribute("user",user);
		   }
		   RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		   dispatcher.forward(request, response);
	   } catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
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
