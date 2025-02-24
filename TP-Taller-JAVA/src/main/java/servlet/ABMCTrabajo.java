package servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.Trabajo;
import entities.Usuario;
import entities.Vehiculo;
import entities.Repuesto;
import logic.TrabajoLogic;
import logic.RepuestoLogic;
import logic.UsuarioLogic;
import logic.VehiculoLogic;

/**
 * Servlet implementation class ABMCTrabajo
 */
@WebServlet({ "/ABMCTrabajo", "/abmctrabajo", "/ABMCtrabajo", "/AbmcTrabajo", "/abmcTrabajo" })
public class ABMCTrabajo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCTrabajo() {
        super();
    }
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/listaTrabajos.jsp").forward(request, response);
	}
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	UsuarioLogic ctrlUsu = new UsuarioLogic();
        TrabajoLogic ctrlTrabajo = new TrabajoLogic();

        String bandera = "";
        String opcion = request.getParameter("optionBM");
        Trabajo t;
        
        String idUserLogin = request.getParameter("idUserLogin");
        Usuario userLogin =ctrlUsu.getById(Integer.parseInt(idUserLogin));
		request.getSession().setAttribute("usuarioLogin", userLogin);

        if (!opcion.equalsIgnoreCase("alta")) {
            String idTrabajo = request.getParameter("idTrabajo");
            t = ctrlTrabajo.getById(Integer.parseInt(idTrabajo));
            request.setAttribute("trabajo", t);
        } else {
            t = new Trabajo();
            request.setAttribute("trabajo", t);
        }
        
        if ((opcion.equalsIgnoreCase("alta")) || (opcion.equalsIgnoreCase("modificacion"))) {
        	RepuestoLogic ctrlRep = new RepuestoLogic();
            LinkedList<Repuesto> repuestos = ctrlRep.getAll();
			request.setAttribute("repuestos", repuestos);
        }

        switch (opcion) {
            case "alta":
            	bandera=request.getParameter("bandera");
            	if(bandera.equalsIgnoreCase("aAnadir")) {
            		request.getRequestDispatcher("WEB-INF/altaTrabajo.jsp").forward(request, response);
            	}
            	else {
            		String tipoTrabajo = request.getParameter("selectTipoTrabajo");
            		String descripcion = request.getParameter("descripcion");
            		float costoManoObra = Float.parseFloat(request.getParameter("cdo"));
            		String repuestosStr = request.getParameter("repuestosSeleccionados");
            		
            		Trabajo tra = new Trabajo();
            		tra.setTipo_trabajo(tipoTrabajo);
            		tra.setDescripcion(descripcion);
            		tra.setCosto_mdo(costoManoObra);
            		
            		// Asignacion de repuestos
                    if (repuestosStr != null && !repuestosStr.isEmpty()) {
                        String[] repuestosDescripciones = repuestosStr.split(",");
                        for (String des : repuestosDescripciones) {
                        	RepuestoLogic R = new RepuestoLogic();
                            Repuesto re = R.getRepuestoByDescripcion(des.trim());
                            if (re != null) {
                                tra.setRepuestos(re);
                            }
                        }
                    }
            		
            		try {
            			ctrlTrabajo.altaTrabajo(tra);
            			request.setAttribute("mensaje", "Trabajo añadido satisfactoriamente.");
    					request.getRequestDispatcher("WEB-INF/listaTrabajos.jsp").forward(request, response);
    						
    				} catch (Exception e) {
    					String msg=e.getMessage();
    					response.getWriter().append("Error ").append(msg);
    				}
            	}
                break;

            case "consulta":
                request.getRequestDispatcher("WEB-INF/consultaTrabajo.jsp").forward(request, response);
                break;

            case "modificacion":
                bandera = request.getParameter("bandera");
                if (bandera.equalsIgnoreCase("aModificar")) {
                    request.getRequestDispatcher("WEB-INF/updateTrabajo.jsp").forward(request, response);
                } else {
                    String tipoTrabajo = request.getParameter("selectTipoTrabajo");
                    String descripcion = request.getParameter("inputDescripcion");
                    float costoMdo = Float.parseFloat(request.getParameter("inputPrecio"));

                    t.setTipo_trabajo(tipoTrabajo);
                    t.setDescripcion(descripcion);
                    t.setCosto_mdo(costoMdo);

                    try {
                    	ctrlTrabajo.modificarTrabajo(t);
                        request.setAttribute("mensaje", "Trabajo modificado satisfactoriamente.");
                        request.getRequestDispatcher("WEB-INF/listaTrabajos.jsp").forward(request, response);	
                    } catch (Exception e){
                    	String msg=e.getMessage();
    					response.getWriter().append("Error ").append(msg);
                    }
                }
                break;

            case "baja":
            	try {
            		ctrlTrabajo.bajaTrabajo(t);
                    request.setAttribute("mensaje", "Trabajo eliminado satisfactoriamente.");
                    request.getRequestDispatcher("WEB-INF/listaTrabajos.jsp").forward(request, response);
                    break;
            	} catch (Exception e) {
            		String msg=e.getMessage();
					response.getWriter().append("Error ").append(msg);
            	}
        }
    }
}
