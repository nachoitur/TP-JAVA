package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.Vehiculo;
import logic.VehiculoLogic;

/**
 * Servlet implementation class ABMCVehiculo
 */
@WebServlet({ "/ABMCVehiculo", "/abmcvehiculo", "/ABMCvehiculo", "/AbmcVehiculo", "/abmcVehiculo" })
public class ABMCVehiculo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCVehiculo() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("WEB-INF/listaVehiculo.jsp").forward(request, response);
	}
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VehiculoLogic ctrlVeh = new VehiculoLogic();

        String opcion = request.getParameter("optionBM");
        Vehiculo v;

        if (!opcion.equalsIgnoreCase("alta")) {
            String idVehiculo = request.getParameter("idVehiculo");
            v = ctrlVeh.getById(Integer.parseInt(idVehiculo));
            request.setAttribute("vehiculo", v);
        } else {
            v = new Vehiculo();
            request.setAttribute("vehiculo", v);
        }

        switch (opcion) {
            case "alta":
                request.getRequestDispatcher("WEB-INF/altaVehiculo.jsp").forward(request, response);
                break;

            case "consulta":
                request.getRequestDispatcher("WEB-INF/consultaVehiculo.jsp").forward(request, response);
                break;

            case "modificacion":
                String bandera = request.getParameter("bandera");

                if (bandera.equalsIgnoreCase("aModificar")) {
                    request.getRequestDispatcher("WEB-INF/updateVehiculo.jsp").forward(request, response);
                } else {
                    String patente = request.getParameter("patente");
                    String marca = request.getParameter("marca");
                    String modelo = request.getParameter("modelo");
                    String anio = request.getParameter("anio");
                    String color = request.getParameter("color");
                    String infoAdicional = request.getParameter("infoAdicional");

                    v.setPatente(patente);
                    v.setMarca(marca);
                    v.setModelo(modelo);
                    v.setAño(Integer.parseInt(anio));
                    v.setColor(color);
                    v.setInfoAdicional(infoAdicional);

                    ctrlVeh.modificarVehicle(v);
                    request.setAttribute("vehiculo", v);
                    request.getRequestDispatcher("WEB-INF/abmcExitoso.jsp").forward(request, response);
                }
                break;

            case "baja":
                ctrlVeh.bajaVehicle(v);
                request.getRequestDispatcher("WEB-INF/abmcExitoso.jsp").forward(request, response);
                break;
        }
    }
}
