package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.Turno;
import entities.Usuario;
import entities.Vehiculo;
import entities.Trabajo;
import java.util.LinkedList;

import logic.TrabajoLogic;
import logic.TurnoLogic;
import logic.UsuarioLogic;
import logic.VehiculoLogic;

/**
 * Servlet implementation class ABMCTurno
 */
@WebServlet({ "/ABMCTurno", "/abmcturno", "/ABMCturno", "/AbmcTurno", "/abmcTurno" })
public class ABMCTurno extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCTurno() {
        super();
    }
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		TurnoLogic ctrlTurno = new TurnoLogic();
		LinkedList<Turno> turnos = ctrlTurno.getAll();
		request.setAttribute("listaTurnos", turnos);
		request.getRequestDispatcher("WEB-INF/listaTurnos.jsp").forward(request, response);
	}

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	UsuarioLogic ctrlUsu = new UsuarioLogic();
    	TurnoLogic ctrlTurno = new TurnoLogic();
    	
    	String bandera = "";
        String opcion = request.getParameter("optionBM");
        Turno t;

        String idUserLogin = request.getParameter("idUserLogin");
        Usuario userLogin = ctrlUsu.getById(Integer.parseInt(idUserLogin));
        request.getSession().setAttribute("usuarioLogin", userLogin);
        
        if (!opcion.equalsIgnoreCase("alta")) {
            LocalDate fechaTurno = LocalDate.parse(request.getParameter("fechaTurno"));
        	LocalTime horaTurno = LocalTime.parse(request.getParameter("horaTurno"));
        	Integer idVehiculo = Integer.parseInt(request.getParameter("idVehiculo"));
            t = ctrlTurno.getByKeys(fechaTurno, horaTurno, idVehiculo);
            request.setAttribute("turno", t);
        } else {
            t = new Turno();
            request.setAttribute("turno", t);
        }
        
        if ((opcion.equalsIgnoreCase("alta")) || (opcion.equalsIgnoreCase("modificacion"))) {
        	TrabajoLogic T = new TrabajoLogic();
			VehiculoLogic V = new VehiculoLogic();
			LinkedList<Trabajo> ts = T.getAll();
			LinkedList<Vehiculo> vs = V.getAll();
			request.setAttribute("trabajos", ts);
			request.setAttribute("vehiculos", vs);
        }

        switch (opcion) {
            case "alta":
            	bandera=request.getParameter("bandera");
            	if(bandera.equalsIgnoreCase("aAnadir")) {
            		request.getRequestDispatcher("WEB-INF/altaTurno.jsp").forward(request, response);
            	}
            	else {
            		String strFechaTurno = request.getParameter("fecha");
            		String strHoraTurno = request.getParameter("hora");
            		String patente = request.getParameter("vehiculo");
            		String strKmact = request.getParameter("kmact");
            		String mp = request.getParameter("medio_pago");
            		String strTot = request.getParameter("total");
            		String trabajosStr = request.getParameter("trabajosSeleccionados");
            		
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
                        	TrabajoLogic T = new TrabajoLogic();
                            Trabajo trabajo = T.getTrabajoByDescripcion(descripcion.trim());
                            if (trabajo != null) {
                                t.setTrabajos(trabajo);
                            }
                        }
                    }
                    
                    try {
    					ctrlTurno.altaTurno(t);
    					request.setAttribute("mensaje", "Turno añadido satisfactoriamente.");
    	                request.getRequestDispatcher("WEB-INF/listaTurnos.jsp").forward(request, response);
    						
    				} catch (Exception e) {
    					String msg=e.getMessage();
    					response.getWriter().append("Error ").append(msg);
    				}
            	}
                break;

            case "consulta":
                request.getRequestDispatcher("WEB-INF/consultaTurno.jsp").forward(request, response);
                break;

            case "modificacion":
                bandera = request.getParameter("bandera");

                if (bandera.equalsIgnoreCase("aModificar")) {
                    request.getRequestDispatcher("WEB-INF/updateTurno.jsp").forward(request, response);
                } else {
                    String kmActuales = request.getParameter("km_actuales");
                    String estado = request.getParameter("estado");
                    String medioPago = request.getParameter("medio_pago");
                    String total = request.getParameter("total");

                    t.setKm_actuales(Integer.parseInt(kmActuales));
                    t.setEstado(estado);
                    t.setMedio_pago(medioPago);
                    t.setTotal(Float.parseFloat(total));

                    ctrlTurno.modificarTurno(t);
                    request.setAttribute("turno", t);
                    request.getRequestDispatcher("WEB-INF/abmcExitoso.jsp").forward(request, response);
                }
                break;

            case "baja":
                ctrlTurno.bajaTurno(t);
                request.getRequestDispatcher("WEB-INF/abmcExitoso.jsp").forward(request, response);
                break;
        }
    }
}
