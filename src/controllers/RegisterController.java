package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	   try {
		   User user = new User();
		   ManageUser manager = new ManageUser();
		   BeanUtils.populate(user, request.getParameterMap());
		   String view = "ViewRegisterForm.jsp";
		   
		   if (manager.isComplete(user)) {
			   if(manager.isUsernameAvailable(user)) {
				   manager.addUser(user);
				   manager.finalize();
				   System.out.println(" user ok, forwarding to ViewLoginForm");
				   view = "ViewLoginForm.jsp";
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
