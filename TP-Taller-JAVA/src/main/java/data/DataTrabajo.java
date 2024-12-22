package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Trabajo;
import entities.Turno;

public class DataTrabajo {

    public LinkedList<Trabajo> getAll() {
        Statement stmt = null;
        ResultSet rs = null;
        LinkedList<Trabajo> trabajos = new LinkedList<>();
        DataRepuesto dr = new DataRepuesto();
        try {
            stmt = dbConnector.getInstancia().getConn().createStatement();
            rs = stmt.executeQuery("SELECT * FROM trabajo");

            if (rs != null) {
                while (rs.next()) {
                    Trabajo t = new Trabajo();
                    t.setId_trabajo(rs.getInt("id_trabajo"));
                    t.setTipo_trabajo(rs.getString("tipoTrabajo"));
                    t.setDescripcion(rs.getString("descripcion"));
                    t.setCosto_mdo(rs.getFloat("costoManoObra"));
                    dr.setRepuestos(t);
                    trabajos.add(t);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                dbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return trabajos;
    }

    public Trabajo getById(int id) {
        Trabajo t = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        DataRepuesto dr = new DataRepuesto();
        try {
            stmt = dbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM trabajo WHERE id_trabajo=?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            if (rs != null && rs.next()) {
                t = new Trabajo();
                t.setId_trabajo(rs.getInt("id_trabajo"));
                t.setTipo_trabajo(rs.getString("tipoTrabajo"));
                t.setDescripcion(rs.getString("descripcion"));
                t.setCosto_mdo(rs.getFloat("costoManoObra"));
                dr.setRepuestos(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                dbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return t;
    }

    public void add(Trabajo t) {
        PreparedStatement stmt = null;
        ResultSet keyResultSet = null;
        try {
            stmt = dbConnector.getInstancia().getConn().prepareStatement(
                    "INSERT INTO trabajo(tipoTrabajo, descripcion, costoManoObra) VALUES(?, ?, ?)",
                    PreparedStatement.RETURN_GENERATED_KEYS);
            stmt.setString(1, t.getTipo_trabajo());
            stmt.setString(2, t.getDescripcion());
            stmt.setFloat(3, t.getCosto_mdo());
            stmt.executeUpdate();

            keyResultSet = stmt.getGeneratedKeys();
            if (keyResultSet != null && keyResultSet.next()) {
                t.setId_trabajo(keyResultSet.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (keyResultSet != null) keyResultSet.close();
                if (stmt != null) stmt.close();
                dbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void update(Trabajo t) {
        PreparedStatement stmt = null;
        try {
            stmt = dbConnector.getInstancia().getConn().prepareStatement(
                    "UPDATE trabajo SET tipoTrabajo=?, descripcion=?, costoManoObra=? WHERE id_trabajo=?");
            stmt.setString(1, t.getTipo_trabajo());
            stmt.setString(2, t.getDescripcion());
            stmt.setFloat(3, t.getCosto_mdo());
            stmt.setInt(4, t.getId_trabajo());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                dbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void remove(Trabajo t) {
        PreparedStatement stmt = null;
        try {
            stmt = dbConnector.getInstancia().getConn().prepareStatement("DELETE FROM trabajo WHERE id_trabajo=?");
            stmt.setInt(1, t.getId_trabajo());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                dbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public void setTrabajos(Turno t) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		DataRepuesto dr = new DataRepuesto();
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("SELECT tr.*\r\n"
					+ "FROM trabajo tr\r\n"
					+ "INNER JOIN trabajo_turno tut\r\n"
					+ "ON tr.id_trabajo=tut.id_trabajo\r\n"
					+ "INNER JOIN turno tu\r\n"
					+ "ON tut.fecha_turno=tu.fecha_turno\r\n"
					+ "AND tut.hora_turno=tu.hora_turno\r\n"
					+ "AND tut.id_vehiculo=tu.id_vehiculo\r\n"
					+ "WHERE tu.id_vehiculo=?");
			stmt.setInt(1, t.getVehiculo().getId_vehiculo());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Trabajo tra = new Trabajo();
					tra.setId_trabajo(rs.getInt("id_trabajo"));
                    tra.setTipo_trabajo(rs.getString("tipoTrabajo"));
                    tra.setDescripcion(rs.getString("descripcion"));
                    tra.setCosto_mdo(rs.getFloat("costoManoObra"));
		            dr.setRepuestos(tra);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				dbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
