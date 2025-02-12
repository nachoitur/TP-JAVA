package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Vehiculo;
import entities.Usuario;

public class DataVehiculo {

	public LinkedList<Vehiculo> getAllVehiculos() {
	    Statement stmt = null;
	    ResultSet rs = null;
	    LinkedList<Vehiculo> vehiculos = new LinkedList<>();
	    try {
	        stmt = dbConnector.getInstancia().getConn().createStatement();
	        rs = stmt.executeQuery("SELECT * FROM vehiculo");

	        if (rs != null) {
	            while (rs.next()) {
	                Vehiculo v = new Vehiculo();
	                v.setId_vehiculo(rs.getInt("id_vehiculo"));
	                v.setPatente(rs.getString("patente"));
	                v.setMarca(rs.getString("marca"));
	                v.setModelo(rs.getString("modelo"));
	                v.setAño(rs.getInt("año"));
	                v.setColor(rs.getString("color"));
	                v.setInfoAdicional(rs.getString("info_adicional"));
	                v.setId_vehiculo(rs.getInt("id_usuario"));
	                vehiculos.add(v);
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
	    return vehiculos;
	}

	public Vehiculo getVehiculoById(int id) {
	    Vehiculo v = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
	    try {
	        stmt = dbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM vehiculo WHERE id_vehiculo = ?");
	        stmt.setInt(1, id);
	        rs = stmt.executeQuery();
	        if (rs != null && rs.next()) {
	            v = new Vehiculo();
	            v.setId_vehiculo(rs.getInt("id_vehiculo"));
	            v.setPatente(rs.getString("patente"));
	            v.setMarca(rs.getString("marca"));
	            v.setModelo(rs.getString("modelo"));
	            v.setAño(rs.getInt("año"));
	            v.setColor(rs.getString("color"));
	            v.setInfoAdicional(rs.getString("info_adicional"));
	            v.setId_vehiculo(rs.getInt("id_usuario"));
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
	    return v;
	}

	public void addVehiculo(Vehiculo v) {
	    PreparedStatement stmt = null;
	    ResultSet keyResultSet = null;
	    try {
	        stmt = dbConnector.getInstancia().getConn().prepareStatement(
	            "INSERT INTO vehiculo(patente, marca, modelo, año, color, info_adicional, id_usuario) VALUES(?, ?, ?, ?, ?, ?, ?)",
	            PreparedStatement.RETURN_GENERATED_KEYS
	        );
	        stmt.setString(1, v.getPatente());
	        stmt.setString(2, v.getMarca());
	        stmt.setString(3, v.getModelo());
	        stmt.setInt(4, v.getAño());
	        stmt.setString(5, v.getColor());
	        stmt.setString(6, v.getInfoAdicional());
	        stmt.setInt(7, v.getId_vehiculo());
	        stmt.executeUpdate();

	        keyResultSet = stmt.getGeneratedKeys();
	        if (keyResultSet != null && keyResultSet.next()) {
	            v.setId_vehiculo(keyResultSet.getInt(1));
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

	public void updateVehiculo(Vehiculo v) {
	    PreparedStatement stmt = null;
	    try {
	        stmt = dbConnector.getInstancia().getConn().prepareStatement(
	            "UPDATE vehiculo SET patente = ?, marca = ?, modelo = ?, año = ?, color = ?, infoAdicional = ? WHERE id_vehiculo = ?"
	        );
	        stmt.setString(1, v.getPatente());
	        stmt.setString(2, v.getMarca());
	        stmt.setString(3, v.getModelo());
	        stmt.setInt(4, v.getAño());
	        stmt.setString(5, v.getColor());
	        stmt.setString(6, v.getInfoAdicional());
	        stmt.setInt(7, v.getId_vehiculo());
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

	public void removeVehiculo(Vehiculo v) {
	    PreparedStatement stmt = null;
	    try {
	        stmt = dbConnector.getInstancia().getConn().prepareStatement("DELETE FROM vehiculo WHERE id_vehiculo = ?");
	        stmt.setInt(1, v.getId_vehiculo());
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
	
	public void setVehiculos(Usuario u) {
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement("SELECT v.*\r\n"
					+ "FROM vehiculo v\r\n"
					+ "INNER JOIN usuario u\r\n"
					+ "ON v.id_usuario=u.id_usuario\r\n"
					+ "WHERE u.id_usuario=?");
			stmt.setInt(1, u.getId_usuario());
			rs= stmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					Vehiculo v = new Vehiculo();
		            v.setId_vehiculo(rs.getInt("id_vehiculo"));
		            v.setPatente(rs.getString("patente"));
		            v.setMarca(rs.getString("marca"));
		            v.setModelo(rs.getString("modelo"));
		            v.setAño(rs.getInt("año"));
		            v.setColor(rs.getString("color"));
		            v.setInfoAdicional(rs.getString("info_adicional"));
		            u.setVehiculos(v);
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
	
	public Vehiculo getVehiculoByPatente(String p) {
	    Vehiculo v = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;
	    try {
	        stmt = dbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM vehiculo WHERE patente = ?");
	        stmt.setString(1, p);
	        rs = stmt.executeQuery();
	        if (rs != null && rs.next()) {
	            v = new Vehiculo();
	            v.setId_vehiculo(rs.getInt("id_vehiculo"));
	            v.setPatente(rs.getString("patente"));
	            v.setMarca(rs.getString("marca"));
	            v.setModelo(rs.getString("modelo"));
	            v.setAño(rs.getInt("año"));
	            v.setColor(rs.getString("color"));
	            v.setInfoAdicional(rs.getString("info_adicional"));
	            v.setId_vehiculo(rs.getInt("id_usuario"));
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
	    return v;
	}
}
