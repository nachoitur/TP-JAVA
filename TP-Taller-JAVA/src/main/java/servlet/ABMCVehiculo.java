package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.Usuario;
import entities.Vehiculo;
import logic.UsuarioLogic;
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
        
    	UsuarioLogic ctrlUsu = new UsuarioLogic();
    	VehiculoLogic ctrlVeh = new VehiculoLogic();

    	String bandera = "";
        String opcion = request.getParameter("optionBM");
        Vehiculo v;
        
        String idUserLogin = request.getParameter("idUserLogin");
        Usuario userLogin = ctrlUsu.getById(Integer.parseInt(idUserLogin));
        request.getSession().setAttribute("usuarioLogin", userLogin);

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
            	bandera=request.getParameter("bandera");
            	if(bandera.equalsIgnoreCase("aAnadir")) {
            		request.getRequestDispatcher("WEB-INF/altaVehiculo.jsp").forward(request, response);
            	}
            	else {
            		String patente = request.getParameter("patente");
            		String marca = request.getParameter("marca");
            		String modelo = request.getParameter("modelo");
            		String strAnio = request.getParameter("anio");
            		String color = request.getParameter("color");
            		String info = request.getParameter("infoAdicional");
            		String dni = request.getParameter("dniDuenio");
            		
            		v.setPatente(patente);
            		v.setMarca(marca);
            		v.setModelo(modelo);
            		v.setAño(Integer.parseInt(strAnio));
            		v.setColor(color);
            		v.setInfoAdicional(info);
            		int id = ctrlUsu.getByDni(dni).getId_usuario();
            		v.setId_usuario(id);
            		
            		try {
                    	ctrlVeh.altaVehicle(v);
                    	request.setAttribute("mensaje", "Vehiculo añadido satisfactoriamente.");
    					request.getRequestDispatcher("WEB-INF/listaVehiculos.jsp").forward(request, response);

    				} catch (Exception e) {
    					String msg=e.getMessage();
    					response.getWriter().append("Error ").append(msg);
    				}
            	}
                break;

            case "consulta":
                request.getRequestDispatcher("WEB-INF/consultaVehiculo.jsp").forward(request, response);
                break;

            case "modificacion":
                bandera = request.getParameter("bandera");
                if (bandera.equalsIgnoreCase("aModificar")) {
                    request.getRequestDispatcher("WEB-INF/updateVehiculo.jsp").forward(request, response);
                } else {
                    String patente = request.getParameter("patente");
                    String marca = request.getParameter("marca");
                    String modelo = request.getParameter("modelo");
                    String strAnio = request.getParameter("anio");
                    String color = request.getParameter("color");
                    String info = request.getParameter("infoAdicional");

                    v.setPatente(patente);
                    v.setMarca(marca);
                    v.setModelo(modelo);
                    v.setAño(Integer.parseInt(strAnio));
                    v.setColor(color);
                    v.setInfoAdicional(info);

                    try {
                    	ctrlVeh.modificarVehicle(v);
                    	request.setAttribute("mensaje", "Vehiculo modificado satisfactoriamente.");
                    	request.getRequestDispatcher("WEB-INF/listaTurnos.jsp").forward(request, response);
                    } catch (Exception e) {
                    	String msg=e.getMessage();
    					response.getWriter().append("Error ").append(msg);
                    }
                }
                break;

            case "baja":
            	try {
            		ctrlVeh.bajaVehicle(v);
            		request.setAttribute("mensaje", "Vehiculo eliminado satisfactoriamente.");
                	request.getRequestDispatcher("WEB-INF/listaTurnos.jsp").forward(request, response);
                    break;
            	} catch (Exception e) {
            		String msg=e.getMessage();
					response.getWriter().append("Error ").append(msg);
            	}
        }
    }
}
