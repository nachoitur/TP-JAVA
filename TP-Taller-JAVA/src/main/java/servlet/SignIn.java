package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
import logic.UsuarioLogic;

/**
 * Servlet implementation class SignIn
 */
@WebServlet({ "/Signin", "/SIGNIN", "/signin", "/signIn", "/SignIn" })
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignIn() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuario usuarioLogin = (Usuario)request.getSession().getAttribute("usuarioLogin");
		if(usuarioLogin!=null) {
			request.getRequestDispatcher("WEB-INF/UserManagement.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("signin.jsp").forward(request, response);
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Usuario user = new Usuario();
		UsuarioLogic usuarioLogic = new UsuarioLogic();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		user.setNombre_usuario(username);
		user.setContraseña(password);
		
		user=usuarioLogic.validarLoginUsuario(user);
		
		if(user!=null) {
			request.getSession().setAttribute("usuarioLogin", user);
			request.getRequestDispatcher("WEB-INF/UserManagement.jsp").forward(request, response);
		}
		else {
			request.setAttribute("mensaje", "El usuario y/o contraseña ingresados son incorrectos.");
			request.getRequestDispatcher("signin.jsp").forward(request, response);
		}
		
	}

}
