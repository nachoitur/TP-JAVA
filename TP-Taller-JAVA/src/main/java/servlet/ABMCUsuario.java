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
 * Servlet implementation class ABMCUsuario
 */
@WebServlet({ "/ABMCUsuario", "/abmcusuario", "/ABMCusuario", "/AbmcUsuario", "/abmcUsuario" })
public class ABMCUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		request.getRequestDispatcher("WEB-INF/listaUsuario.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bandera="";
		UsuarioLogic ctrlUsu = new UsuarioLogic();
		String opcion = request.getParameter("optionBM");
		String idUserLogin = request.getParameter("idUserLogin");
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		request.getSession().setAttribute("usuarioLogin", userLogin);
		
		Usuario u;
		
		if(!opcion.equalsIgnoreCase("alta")) {
			String idUser = request.getParameter("idUser");
			u =ctrlUsu.getById(Integer.parseInt(idUser));
			request.setAttribute("usuario", u);
		}
		else {
			 u = new Usuario();
			request.setAttribute("usuario", u);
		}
		
		switch (opcion) {
		case "alta":
			request.getRequestDispatcher("WEB-INF/altaMecanico.jsp").forward(request, response);
		break;
		case "consulta":
			request.getRequestDispatcher("WEB-INF/consultaUsuario.jsp").forward(request, response);
		break;
		
		case "modificacion":
			bandera=request.getParameter("bandera");
			
			if (bandera.equalsIgnoreCase("aModificar")) {
				request.getRequestDispatcher("WEB-INF/updateUsuario.jsp").forward(request, response);
			}
			else {	
				
				String name = request.getParameter("nombre");
				String surname = request.getParameter("apellido");
				String telephone = request.getParameter("telefono");
				String email = request.getParameter("email");
				String typeDoc = request.getParameter("selectTipo_doc");
				String numDoc = request.getParameter("num_doc");
				String direccion = request.getParameter("direccion");
				String username = request.getParameter("nombre_usuario");
				String password = request.getParameter("contraseña");
				String passwordRepeat = request.getParameter("contraseñaRepetida");
				
				if (ctrlUsu.validarContraseña(password, passwordRepeat)) {
					u.setNombre(name);
					u.setApellido(surname);
					u.setTelefono(telephone);
					u.setEmail(email);
					u.setTipo_doc(typeDoc);
					u.setNum_doc(numDoc);
					u.setDireccion(direccion);
					u.setNombre_usuario(username);
					u.setContraseña(password);					
				}
				ctrlUsu.modificarUser(u);
				request.setAttribute("usuario", u);
				request.getRequestDispatcher("WEB-INF/abmcExitosa.jsp").forward(request, response);
			}
			break;

		case "baja":
				ctrlUsu.bajaUser(u);
				request.getRequestDispatcher("WEB-INF/abmcExitosa.jsp").forward(request, response);
			break;
		}
	}
}
