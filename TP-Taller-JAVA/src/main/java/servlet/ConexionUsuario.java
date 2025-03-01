package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Trabajo;
import entities.Usuario;
import entities.Vehiculo;
import entities.Turno;
import logic.TrabajoLogic;
import logic.UsuarioLogic;
import logic.VehiculoLogic;
import logic.TurnoLogic;

/**
 * Servlet implementation class ConexionUsuario
 */
@WebServlet("/ConexionUsuario")
public class ConexionUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConexionUsuario() {
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
		
		String bandera = "";
		UsuarioLogic ctrlUsu = new UsuarioLogic();
		TrabajoLogic ctrlTra = new TrabajoLogic();
		String opcion = request.getParameter("optionBM");
		String idUserLogin = request.getParameter("idUserLogin");
		Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		request.getSession().setAttribute("usuarioLogin", userLogin);
		
		switch(opcion){
		// REGISTRO DE VEHICULO
		case "registrarVehiculo":
			bandera=request.getParameter("bandera");
			if(bandera.equalsIgnoreCase("agregar")) {
				request.getRequestDispatcher("WEB-INF/altaVehiculoUsuario.jsp").forward(request, response);
			}
			else {
				String patente = request.getParameter("patente");
        		String marca = request.getParameter("marca");
        		String modelo = request.getParameter("modelo");
        		String strAnio = request.getParameter("anio");
        		String color = request.getParameter("color");
        		
        		Vehiculo v = new Vehiculo();
        		VehiculoLogic ctrlVeh = new VehiculoLogic();
        		
        		v.setPatente(patente);
        		v.setMarca(marca);
        		v.setModelo(modelo);
        		v.setAño(Integer.parseInt(strAnio));
        		v.setColor(color);
        		v.setInfoAdicional("");
        		v.setId_usuario(userLogin.getId_usuario());
        		
        		try {
                	ctrlVeh.altaVehicle(v);
                	request.setAttribute("operacion", "vehiculo");
					request.getRequestDispatcher("WEB-INF/accionUsuarioExito.jsp").forward(request, response);

				} catch (Exception e) {
					String msg=e.getMessage();
					response.getWriter().append("Error ").append(msg);
				}
			}
			break;
			
		// SACAR TURNO
		case "sacarTurno":
			if(!userLogin.getVehiculos().isEmpty()) {
				bandera=request.getParameter("bandera");
				if(bandera.equalsIgnoreCase("agregar")) {
					LinkedList<Trabajo> trabajos = ctrlTra.getAll();
					request.setAttribute("trabajos", trabajos);
					request.getRequestDispatcher("WEB-INF/altaTurnoUsuario.jsp").forward(request, response);
				}
				else {
	        		String strFechaTurno = request.getParameter("fecha");
	        		String strHoraTurno = request.getParameter("hora");
	        		String patente = request.getParameter("vehiculo");
	        		String strKmact = request.getParameter("kmact");
	        		String mp = request.getParameter("medioPago");
	        		String strTot = request.getParameter("total");
	        		String trabajosStr = request.getParameter("trabajosSeleccionados");
	        		
	        		TurnoLogic ctrlTur = new TurnoLogic();
	        		Turno t = new Turno();
	        		
	        		VehiculoLogic ctrlVeh = new VehiculoLogic();
	                Vehiculo vehiculo = ctrlVeh.getByPatente(patente);
	                
	                t.setFecha(LocalDate.parse(strFechaTurno));
	                t.setHora(LocalTime.parse(strHoraTurno));
	                t.setVehiculo(vehiculo);
	                t.setKm_actuales(Integer.parseInt(strKmact));
	                t.setEstado("Reservado");
	                t.setMedio_pago(mp);
	                t.setTotal(Integer.parseInt(strTot));
	                
	                // Asignacion de trabajos
	                if (trabajosStr != null && !trabajosStr.isEmpty()) {
	                    String[] trabajosDescripciones = trabajosStr.split(",");
	                    for (String descripcion : trabajosDescripciones) {
	                    	
	                        Trabajo trabajo = ctrlTra.getTrabajoByDescripcion(descripcion.trim());
	                        if (trabajo != null) {
	                            t.setTrabajos(trabajo);
	                        }
	                    }
	                }
	                
	                try {
	                	ctrlTur.altaTurno(t);
	                	request.setAttribute("operacion", "turno");
	                	request.getRequestDispatcher("WEB-INF/accionUsuarioExito.jsp").forward(request, response);

					} catch (Exception e) {
						String msg=e.getMessage();
						response.getWriter().append("Error ").append(msg);
					}
	        	}
			}
			else {
				request.getRequestDispatcher("WEB-INF/usuarioVehiculosVacios.jsp").forward(request, response);
			}
			
			break;
			
		// VER VEHICULOS DE UN USUARIO
		case "misVehiculos":
			request.getRequestDispatcher("WEB-INF/listaVehiculosUsuario.jsp").forward(request, response);
			break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + opcion);
		}
		
	}
}
	
