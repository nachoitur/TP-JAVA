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
import logic.TrabajoLogic;
import logic.UsuarioLogic;

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
		TrabajoLogic ctrlTrabajo = new TrabajoLogic();
		LinkedList<Trabajo> trabajos= ctrlTrabajo.getAll();
		request.setAttribute("listaTrabajo", trabajos);
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

        switch (opcion) {
            case "alta":
            	bandera=request.getParameter("bandera");
            	if(bandera.equalsIgnoreCase("aAnadir")) {
            		request.getRequestDispatcher("WEB-INF/altaTrabajo.jsp").forward(request, response);
            	}
            	else {
            		String tipoTrabajo = request.getParameter("tipoTrabajo");
            		String descripcion = request.getParameter("descripcion");
            		float costoManoObra = Float.parseFloat(request.getParameter("costoManoObra"));
            		
            		Trabajo tra = new Trabajo();
            		tra.setTipo_trabajo(tipoTrabajo);
            		tra.setDescripcion(descripcion);
            		tra.setCosto_mdo(costoManoObra);
            		
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
                    String tipoTrabajo = request.getParameter("tipo_trabajo");
                    String descripcion = request.getParameter("descripcion");
                    float costoMdo = Float.parseFloat(request.getParameter("costo_mdo"));

                    t.setTipo_trabajo(tipoTrabajo);
                    t.setDescripcion(descripcion);
                    t.setCosto_mdo(costoMdo);

                    ctrlTrabajo.modificarTrabajo(t);
                    request.setAttribute("mensaje", "Trabajo modificado satisfactoriamente.");
                    request.getRequestDispatcher("WEB-INF/listaTrabajos.jsp").forward(request, response);
                }
                break;

            case "baja":
                ctrlTrabajo.bajaTrabajo(t);
                request.setAttribute("mensaje", "Trabajo eliminado satisfactoriamente.");
                request.getRequestDispatcher("WEB-INF/listaTrabajos.jsp").forward(request, response);
                break;
        }
    }
}
