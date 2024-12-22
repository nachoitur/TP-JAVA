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
 * Servlet implementation class ConexionUsuario
 */
@WebServlet("/ConexionUsuario")
public class ConexionUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConexionUser() {
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
		
		UsuarioLogic ctrlUsu = new UsuarioLogic();
		String opcion = request.getParameter("optionBM");
		String idUserLogin = request.getParameter("idUserLogin");
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		request.getSession().setAttribute("usuarioLogin", userLogin);
		
		switch(opcion){
		case "agregarVehiculo":
			request.getRequestDispatcher("WEB-INF/vistaAddVehiculos.jsp").forward(request, response);
			break;
		case "sacarTurno":
			request.getRequestDispatcher("WEB-INF/vistaTurnos.jsp").forward(request, response);
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + opcion);
		}
		
	}
}
	
