package servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Repuesto;
import entities.Trabajo;
import entities.Turno;
import entities.Usuario;
import entities.Vehiculo;
import logic.RepuestoLogic;
import logic.TrabajoLogic;
import logic.TurnoLogic;
import logic.UsuarioLogic;
import logic.VehiculoLogic;

/**
 * Servlet implementation class Conexion
 */
@WebServlet("/Conexion")
public class Conexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Conexion() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UsuarioLogic ctrlUsu= new UsuarioLogic();
		String opcion = request.getParameter("optionBM");
		String idUserLogin = request.getParameter("idUserLogin");
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		request.getSession().setAttribute("usuarioLogin", userLogin);
		
		switch (opcion) {
		case "usuarios": {
			LinkedList<Usuario> users = ctrlUsu.getAll();
			request.setAttribute("listaUsuarios", users);
			request.getRequestDispatcher("WEB-INF/listaUsuarios.jsp").forward(request, response);
			break;
		}
		case "repuestos":
			RepuestoLogic ctrlRep = new RepuestoLogic();
			LinkedList<Repuesto> repuestos = ctrlRep.getAll();
			request.setAttribute("listaRepuestos", repuestos);
			request.getRequestDispatcher("WEB-INF/listaRepuestos.jsp").forward(request, response);
			break;
		case "trabajos":
			TrabajoLogic ctrlTra = new TrabajoLogic();
			LinkedList<Trabajo> trabajos = ctrlTra.getAll();
			request.setAttribute("listaTrabajos", trabajos);
			request.getRequestDispatcher("WEB-INF/listaTrabajos.jsp").forward(request, response);
			break;
			
		case "turnos":
			TurnoLogic ctrlTur = new TurnoLogic();
			LinkedList<Turno> turnos = ctrlTur.getAll();
			request.setAttribute("listaTurnos", turnos);
			request.getRequestDispatcher("WEB-INF/listaPlanes.jsp").forward(request, response);
			
			break;
		case "vehiculos":
			VehiculoLogic ctrlVeh = new VehiculoLogic();
			LinkedList<Vehiculo> vehiculos = ctrlVeh.getAll();
			request.setAttribute("listaVehiculos", vehiculos);
			request.getRequestDispatcher("WEB-INF/listaVehiculos.jsp").forward(request, response);
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + opcion);
		}

		
	}

}
