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
import logic.TurnoLogic;

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
		request.getRequestDispatcher("WEB-INF/listaTurno.jsp").forward(request, response);
	}

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TurnoLogic ctrlTurno = new TurnoLogic();

        String opcion = request.getParameter("optionBM");
        Turno t;

        if (!opcion.equalsIgnoreCase("alta")) {
            String idTurno = request.getParameter("idTurno");
            t = ctrlTurno.getById(Integer.parseInt(idTurno));
            request.setAttribute("turno", t);
        } else {
            t = new Turno();
            request.setAttribute("turno", t);
        }

        switch (opcion) {
            case "alta":
                request.getRequestDispatcher("WEB-INF/altaTurno.jsp").forward(request, response);
                break;

            case "consulta":
                request.getRequestDispatcher("WEB-INF/consultaTurno.jsp").forward(request, response);
                break;

            case "modificacion":
                String bandera = request.getParameter("bandera");

                if (bandera.equalsIgnoreCase("aModificar")) {
                    request.getRequestDispatcher("WEB-INF/updateTurno.jsp").forward(request, response);
                } else {
                    String fecha = request.getParameter("fecha");
                    String hora = request.getParameter("hora");
                    String kmActuales = request.getParameter("km_actuales");
                    String estado = request.getParameter("estado");
                    String medioPago = request.getParameter("medio_pago");
                    String total = request.getParameter("total");

                    t.setFecha(LocalDate.parse(fecha));
                    t.setHora(LocalTime.parse(hora));
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
