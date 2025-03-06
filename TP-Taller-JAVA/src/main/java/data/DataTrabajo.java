package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Trabajo;
import entities.Turno;
import entities.Repuesto;

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
            
            for(Repuesto r : t.getRepuestos()) {
            	stmt = dbConnector.getInstancia().getConn().prepareStatement("INSERT INTO trabajo_repuesto"
            			+ "(id_trabajo, id_repuesto) VALUES(?, ?)");
                stmt.setInt(1, t.getId_trabajo());
                stmt.setInt(2, r.getId_repuesto());
                stmt.executeUpdate();
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
            
            stmt.close();
            
            stmt = dbConnector.getInstancia().getConn().prepareStatement(
                    "DELETE FROM trabajo_repuesto WHERE id_trabajo=?");
            stmt.setInt(1, t.getId_trabajo());
            stmt.executeUpdate();
            
            for(Repuesto re: t.getRepuestos()) {
            	stmt = dbConnector.getInstancia().getConn().prepareStatement("INSERT INTO trabajo_repuesto"
            			+ "(id_trabajo, id_repuesto) VALUES(?, ?)");
                stmt.setInt(1, t.getId_trabajo());
                stmt.setInt(2, re.getId_repuesto());
                stmt.executeUpdate();
            }
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
        	stmt = dbConnector.getInstancia().getConn().prepareStatement("DELETE FROM trabajo_repuesto WHERE id_trabajo=?");
        	stmt.setInt(1, t.getId_trabajo());
            stmt.executeUpdate();
            
            stmt.close();
            
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
			stmt=dbConnector.getInstancia().getConn().prepareStatement("SELECT tr.* FROM trabajo tr "
					+ "INNER JOIN trabajo_turno tut ON tr.id_trabajo=tut.id_trabajo "
					+ "WHERE tut.fecha_turno=? AND tut.hora_turno=? AND tut.id_vehiculo=?");
			
			int id = t.getVehiculo().getId_vehiculo();
			
			stmt.setDate(1,java.sql.Date.valueOf(t.getFecha()));
            stmt.setTime(2, java.sql.Time.valueOf(t.getHora()));
			stmt.setInt(3, id);
			
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Trabajo tra = new Trabajo();
					tra.setId_trabajo(rs.getInt("id_trabajo"));
                    tra.setTipo_trabajo(rs.getString("tipoTrabajo"));
                    tra.setDescripcion(rs.getString("descripcion"));
                    tra.setCosto_mdo(rs.getFloat("costoManoObra"));
		            dr.setRepuestos(tra);
		            t.setTrabajos(tra);
		        }
			}else {
				System.out.println("puto");
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
    
    public Trabajo getByDesc(String des) {
        Trabajo t = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        DataRepuesto dr = new DataRepuesto();
        try {
            stmt = dbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM trabajo WHERE descripcion=?");
            stmt.setString(1, des);
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
}
