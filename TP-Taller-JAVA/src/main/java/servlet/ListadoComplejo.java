package servlet;

import java.util.LinkedList;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Turno;

import logic.TurnoLogic;

/**
 * Servlet implementation class ListadoComplejo
 */
@WebServlet("/ListadoComplejo")
public class ListadoComplejo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListadoComplejo() {
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
		// TODO Auto-generated method stub
		String bandera = request.getParameter("bandera");
		int idVehiculo = Integer.parseInt(request.getParameter("idVehiculo"));
		
		if (bandera.equalsIgnoreCase("preguntar")) {
			request.setAttribute("idVehiculo", idVehiculo);
			request.getRequestDispatcher("WEB-INF/seleccionarTrabajo.jsp").forward(request, response);
		}
		else {
			String tipoTrabajo = request.getParameter("tipoTrabajo");
			System.out.println(tipoTrabajo);
            TurnoLogic ctrlTurno = new TurnoLogic();
            LinkedList<Turno> trabajosFinalizados = ctrlTurno.obtenerTrabajosFinalizadosPorTipo(idVehiculo, tipoTrabajo);
            System.out.println(trabajosFinalizados);
            request.setAttribute("lista", trabajosFinalizados);
            request.setAttribute("tipo", tipoTrabajo);
            request.setAttribute("idVehiculo", idVehiculo);
            request.getRequestDispatcher("WEB-INF/listadoTrabajos.jsp").forward(request, response);
		}
	}

}
