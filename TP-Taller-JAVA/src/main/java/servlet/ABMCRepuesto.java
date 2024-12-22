package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.Repuesto;
import logic.RepuestoLogic;

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
        RepuestoLogic ctrlRepuesto = new RepuestoLogic();

        String opcion = request.getParameter("optionBM");
        Repuesto r;

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
                request.getRequestDispatcher("WEB-INF/altaRepuesto.jsp").forward(request, response);
                break;

            case "consulta":
                request.getRequestDispatcher("WEB-INF/consultaRepuesto.jsp").forward(request, response);
                break;

            case "modificacion":
                String bandera = request.getParameter("bandera");

                if (bandera.equalsIgnoreCase("aModificar")) {
                    request.getRequestDispatcher("WEB-INF/updateRepuesto.jsp").forward(request, response);
                } else {
                    String descripcion = request.getParameter("descripcion");
                    String precio = request.getParameter("precio");
                    String stock = request.getParameter("stock");

                    r.setDescripcion(descripcion);
                    r.setPrecio(Float.parseFloat(precio));
                    r.setStock(Integer.parseInt(stock));

                    ctrlRepuesto.modificarRepuesto(r);
                    request.setAttribute("repuesto", r);
                    request.getRequestDispatcher("WEB-INF/abmcExitoso.jsp").forward(request, response);
                }
                break;

            case "baja":
                ctrlRepuesto.bajaRepuesto(r);
                request.getRequestDispatcher("WEB-INF/abmcExitoso.jsp").forward(request, response);
                break;
        }
    }
}
