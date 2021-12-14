package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginServlet() {
        super();
 
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try(PrintWriter out= response.getWriter()){
			
			
			String useremail=request.getParameter("email");
			String userPassword=request.getParameter("password");
			
			UserDao dao=new UserDao(ConnectionProvider.getConnection());
			User u=dao.getUserByEmailAndPassword(useremail, userPassword);
			
			
			if(u==null)
			{
				//login success
				out.println("Invalid Login");
				Message msg=new Message("Invalid Details! try with another","error","alert-danger");
				
				HttpSession s=request.getSession();
				s.setAttribute("msg",msg);
				
				response.sendRedirect("login_page.jsp");
			}
			else {
				//login success
				HttpSession s=request.getSession();
				s.setAttribute("currentUser", u);
				response.sendRedirect("Profile.jsp");
				
				
			}
			
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
