package servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Usuario;
import logic.UsuarioLogic;

/**
 * Servlet implementation class Registro
 */
@WebServlet({ "/Registro", "/REGISTRO", "/registro" })
public class Registro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registro() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuarioLogic ctrlUsu= new UsuarioLogic();
		if(request.getParameter("idUserLogin")!=null) {
			String idUserLogin = request.getParameter("idUserLogin");
			Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
			request.getSession().setAttribute("usuarioLogin", userLogin);
		}
		
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String telefono = request.getParameter("telefono");
		String email = request.getParameter("email");
		String tipo_doc = request.getParameter("selectTipo_doc");
		String num_doc = request.getParameter("num_doc");
		String direccion = request.getParameter("direccion");
		String nombre_usuario = request.getParameter("nombre_usuario");
		String contraseña = request.getParameter("contraseña");
		String contraseñaRepetida = request.getParameter("contraseñaRepetida");
		UsuarioLogic usuarioLogic = new UsuarioLogic();
		if (usuarioLogic.validarContraseña(contraseña, contraseñaRepetida)) {
			Usuario user = new Usuario();
			user.setNombre(nombre);
			user.setApellido(apellido);
			user.setTelefono(telefono);
			user.setEmail(email);
			user.setTipo_doc(tipo_doc);
			user.setNum_doc(num_doc);
			user.setDireccion(direccion);
			user.setNombre_usuario(nombre_usuario);
			user.setContraseña(contraseña);
			user.setRol(2);
			
			try {
				usuarioLogic.altaUser(user);
				if(request.getSession().getAttribute("usuarioLogin")!=null) {
					LinkedList<Usuario> users = ctrlUsu.getAll();
					request.setAttribute("listaUsuarios", users);
					request.getRequestDispatcher("WEB-INF/listaUsuarios.jsp").forward(request, response);
				}
				else {
					response.sendRedirect("index.html");
				}
			} catch (Exception e) {
				String msg=e.getMessage();
				response.getWriter().append("Error ").append(msg);
			}
		}
		else {
			request.setAttribute("mensaje", "Las contraseñas ingresadas son diferentes.");
			request.getRequestDispatcher("registro.jsp").forward(request, response);
		}
		
	
	}

}