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
 * Servlet implementation class MecanicoAlta
 */
@WebServlet("/MecanicoAlta")
public class MecanicoAlta extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MecanicoAlta() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
			user.setRol(1);
			
			try {
				usuarioLogic.altaUser(user);
				
				request.getSession().setAttribute("usuario", user);
				
				request.getRequestDispatcher("WEB-INF/successfullSignUp.jsp").forward(request, response);
				
			} catch (Exception e) {
				String msg=e.getMessage();
				response.getWriter().append("Error ").append(msg);
			}
			
		}
		else {
			request.setAttribute("mensaje", "Las contraseñas ingresadas son diferentes.");
			request.getRequestDispatcher("WEB-INF/altaMecanico.jsp").forward(request, response);
		}
	}

}
