package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Repuesto;
import entities.Trabajo;

public class DataRepuesto {

	public LinkedList<Repuesto> getAllRepuestos() {
	    Statement stmt = null;
	    ResultSet rs = null;
	    LinkedList<Repuesto> repuestos = new LinkedList<>();
	    try {
	        stmt = dbConnector.getInstancia().getConn().createStatement();
	        rs = stmt.executeQuery("SELECT * FROM repuesto");

	        if (rs != null) {
	            while (rs.next()) {
	                Repuesto r = new Repuesto();
	                r.setId_repuesto(rs.getInt("id_repuesto"));
	                r.setDescripcion(rs.getString("descripcion"));
	                r.setPrecio(rs.getFloat("precio"));
	                r.setStock(rs.getInt("stock"));
	                repuestos.add(r);
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
	    return repuestos;
	}

	public Repuesto getRepuestoById(int id) {
	    Repuesto r = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
	    try {
	        stmt = dbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM repuesto WHERE id_repuesto = ?");
	        stmt.setInt(1, id);
	        rs = stmt.executeQuery();
	        if (rs != null && rs.next()) {
	            r = new Repuesto();
	            r.setId_repuesto(rs.getInt("id_repuesto"));
	            r.setDescripcion(rs.getString("descripcion"));
	            r.setPrecio(rs.getFloat("precio"));
	            r.setStock(rs.getInt("stock"));
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
	    return r;
	}

	public void addRepuesto(Repuesto r) {
	    PreparedStatement stmt = null;
	    ResultSet keyResultSet = null;
	    try {
	        stmt = dbConnector.getInstancia().getConn().prepareStatement(
	            "INSERT INTO repuesto(descripcion, precio, stock) VALUES(?, ?, ?)",
	            PreparedStatement.RETURN_GENERATED_KEYS
	        );
	        stmt.setString(1, r.getDescripcion());
	        stmt.setFloat(2, r.getPrecio());
	        stmt.setInt(3, r.getStock());
	        stmt.executeUpdate();

	        keyResultSet = stmt.getGeneratedKeys();
	        if (keyResultSet != null && keyResultSet.next()) {
	            r.setId_repuesto(keyResultSet.getInt(1));
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

	public void updateRepuesto(Repuesto r) {
	    PreparedStatement stmt = null;
	    try {
	        stmt = dbConnector.getInstancia().getConn().prepareStatement(
	            "UPDATE repuesto SET descripcion = ?, precio = ?, stock = ? WHERE id_repuesto = ?"
	        );
	        stmt.setString(1, r.getDescripcion());
	        stmt.setFloat(2, r.getPrecio());
	        stmt.setInt(3, r.getStock());
	        stmt.setInt(4, r.getId_repuesto());
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

	public void removeRepuesto(Repuesto r) {
	    PreparedStatement stmt = null;
	    try {
	        stmt = dbConnector.getInstancia().getConn().prepareStatement("DELETE FROM repuesto WHERE id_repuesto = ?");
	        stmt.setInt(1, r.getId_repuesto());
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
	
	public void setRepuestos(Trabajo t) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("SELECT r.*\r\n"
					+ "FROM repuesto r\r\n"
					+ "INNER JOIN trabajo_repuesto tr\r\n"
					+ "ON r.id_repuesto=tr.id_repuesto\r\n"
					+ "INNER JOIN trabajo t\r\n"
					+ "ON tr.id_trabajo=t.id_trabajo\r\n"
					+ "WHERE t.id_trabajo=?");
			stmt.setInt(1, t.getId_trabajo());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Repuesto r = new Repuesto();
	                r.setId_repuesto(rs.getInt("id_repuesto"));
	                r.setDescripcion(rs.getString("descripcion"));
	                r.setPrecio(rs.getFloat("precio"));
	                r.setStock(rs.getInt("stock"));
		            t.setRepuestos(r);
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
	
	public Repuesto getByDesc(String des) {
        Repuesto r = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = dbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM repuesto WHERE descripcion=?");
            stmt.setString(1, des);
            rs = stmt.executeQuery();
            if (rs != null && rs.next()) {
                r = new Repuesto();
                r.setId_repuesto(rs.getInt("id_repuesto"));
                r.setDescripcion(rs.getString("descripcion"));
                r.setPrecio(rs.getFloat("precio"));
                r.setStock(rs.getInt("stock"));
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
        return r;
    }
}
