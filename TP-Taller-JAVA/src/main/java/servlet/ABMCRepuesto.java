package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Repuesto;
import entities.Usuario;

import logic.RepuestoLogic;
import logic.UsuarioLogic;

/**
 * Servlet implementation class ABMCRepuesto
 */
@WebServlet({ "/ABMCRepuesto", "/abmcrepuesto", "/ABMCrepuesto", "/AbmcRepuesto", "/abmcRepuesto" })
public class ABMCRepuesto extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ABMCRepuesto() {
        super();
    }
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		request.getRequestDispatcher("WEB-INF/listaRepuesto.jsp").forward(request, response);
	}

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	UsuarioLogic ctrlUsuario= new UsuarioLogic();
    	RepuestoLogic ctrlRepuesto = new RepuestoLogic();
    	
    	String bandera = "";
        String opcion = request.getParameter("optionBM");
        Repuesto r;
        
        String idUserLogin = request.getParameter("idUserLogin");
        Usuario userLogin = ctrlUsuario.getById(Integer.parseInt(idUserLogin));
        request.getSession().setAttribute("usuarioLogin", userLogin);

        if (!opcion.equalsIgnoreCase("alta")) {
            String idRepuesto = request.getParameter("idRepuesto");
            r = ctrlRepuesto.getById(Integer.parseInt(idRepuesto));
            request.setAttribute("repuesto", r);
        } else {
            r = new Repuesto();
            request.setAttribute("repuesto", r);
        }

        switch (opcion) {
            case "alta":
            	bandera = request.getParameter("bandera");
            	if (bandera.equalsIgnoreCase("aAnadir")){
            		request.getRequestDispatcher("WEB-INF/altaRepuesto.jsp").forward(request, response);
            	}
            	else {
            		String desc = request.getParameter("descripcion");
            		String strPrecio = request.getParameter("precio");
            		String strStock = request.getParameter("stock");
            		
            		r.setDescripcion(desc);
            		r.setPrecio(Float.parseFloat(strPrecio));
            		r.setStock(Integer.parseInt(strStock));
            		
            		try {
                    	ctrlRepuesto.altaRepuesto(r);
                    	request.setAttribute("mensaje", "Repuesto añadido satisfactoriamente.");
    					request.getRequestDispatcher("WEB-INF/listaRepuestos.jsp").forward(request, response);

    				} catch (Exception e) {
    					String msg=e.getMessage();
    					response.getWriter().append("Error ").append(msg);
    				}
            	}
                break;

            case "consulta":
                request.getRequestDispatcher("WEB-INF/consultaRepuesto.jsp").forward(request, response);
                break;

            case "modificacion":
                bandera = request.getParameter("bandera");
                if (bandera.equalsIgnoreCase("aModificar")) {
                    request.getRequestDispatcher("WEB-INF/updateRepuesto.jsp").forward(request, response);
                } else {
                    String descripcion = request.getParameter("descripcion");
                    String precio = request.getParameter("precio");
                    String stock = request.getParameter("stock");

                    r.setDescripcion(descripcion);
                    r.setPrecio(Float.parseFloat(precio));
                    r.setStock(Integer.parseInt(stock));

					try{
						ctrlRepuesto.modificarRepuesto(r);
						request.setAttribute("mensaje", "Repuesto modificado satisfactoriamente.");
                    	request.getRequestDispatcher("WEB-INF/listaRepuestos.jsp").forward(request, response);
					} catch (Exception e){
						String msg=e.getMessage();
    					response.getWriter().append("Error ").append(msg);
					}
                }
                break;

            case "baja":
            	try {
            		ctrlRepuesto.bajaRepuesto(r);
            		request.setAttribute("mensaje", "Repuesto eliminado satisfactoriamente.");
                    request.getRequestDispatcher("WEB-INF/listaRepuestos.jsp").forward(request, response);
                    break;	
            	} catch (Exception e) {
            		String msg=e.getMessage();
					response.getWriter().append("Error ").append(msg);
            	}
        }
    }
}
