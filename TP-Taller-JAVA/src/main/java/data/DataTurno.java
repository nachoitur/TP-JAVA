package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Turno;

public class DataTurno {

    public LinkedList<Turno> getAll() {
        Statement stmt = null;
        ResultSet rs = null;
        DataTrabajo dt = new DataTrabajo();
        DataVehiculo dv = new DataVehiculo();
        LinkedList<Turno> turnos = new LinkedList<>();
        try {
            stmt = dbConnector.getInstancia().getConn().createStatement();
            rs = stmt.executeQuery("SELECT * FROM turno");

            if (rs != null) {
                while (rs.next()) {
                    Turno t = new Turno();
                    t.setFecha(rs.getDate("fecha_turno").toLocalDate());
                    t.setHora(rs.getTime("hora_turno").toLocalTime());
                    t.setVehiculo(dv.getVehiculoById(rs.getInt("id_vehiculo")));
                    t.setKm_actuales(rs.getInt("km_actuales"));
                    t.setEstado(rs.getString("estado"));
                    t.setMedio_pago(rs.getString("medio_pago"));
                    t.setTotal(rs.getFloat("total"));
                    dt.setTrabajos(t);
                    turnos.add(t);
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
        return turnos;
    }

    public Turno getById(int id) {
        Turno t = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        DataTrabajo dt = new DataTrabajo();
        DataVehiculo dv = new DataVehiculo();
        try {
            stmt = dbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM turno WHERE id_turno=?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            if (rs != null && rs.next()) {
                t = new Turno();
                t.setFecha(rs.getDate("fecha_turno").toLocalDate());
                t.setHora(rs.getTime("hora_turno").toLocalTime());
                t.setVehiculo(dv.getVehiculoById(rs.getInt("id_vehiculo")));
                t.setKm_actuales(rs.getInt("km_actuales"));
                t.setEstado(rs.getString("estado"));
                t.setMedio_pago(rs.getString("medio_pago"));
                t.setTotal(rs.getFloat("total"));
                dt.setTrabajos(t);
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

    public void add(Turno t) {
        PreparedStatement stmt = null;
        ResultSet keyResultSet = null;
        try {
            stmt = dbConnector.getInstancia().getConn().prepareStatement(
                    "INSERT INTO turno(fecha_turno, hora_turno, id_vehiculo, km_actuales,"
                    + "estado, medio_pago, total) VALUES(?, ?, ?, ?, ?, ?, ?)");
            stmt.setDate(1, java.sql.Date.valueOf(t.getFecha()));
            stmt.setTime(2, java.sql.Time.valueOf(t.getHora()));
            stmt.setInt(3, t.getVehiculo().getId_vehiculo());
            stmt.setInt(4, t.getKm_actuales());
            stmt.setString(5, t.getEstado());
            stmt.setString(6, t.getMedio_pago());
            stmt.setFloat(7, t.getTotal());
            stmt.executeUpdate();

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

    public void update(Turno t) {
        PreparedStatement stmt = null;
        try {
            stmt = dbConnector.getInstancia().getConn().prepareStatement(
                    "UPDATE turno SET km_actuales=?, estado=?, medio_pago=?, total=? WHERE fecha_turno=? AND hora_turno=? AND id_vehiculo=?");
            stmt.setInt(1, t.getKm_actuales());
            stmt.setString(2, t.getEstado());
            stmt.setString(3, t.getMedio_pago());
            stmt.setFloat(4, t.getTotal());
            stmt.setDate(5, java.sql.Date.valueOf(t.getFecha()));
            stmt.setTime(6, java.sql.Time.valueOf(t.getHora()));
            stmt.setInt(7, t.getVehiculo().getId_vehiculo());
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

    public void remove(Turno t) {
        PreparedStatement stmt = null;
        try {
            stmt = dbConnector.getInstancia().getConn().prepareStatement("DELETE FROM turno WHERE fecha_turno=?"
            		+ "AND hora_turno=? AND id_vehiculo=?");
            stmt.setDate(1, java.sql.Date.valueOf(t.getFecha()));
            stmt.setTime(2, java.sql.Time.valueOf(t.getHora()));
            stmt.setInt(3, t.getVehiculo().getId_vehiculo());
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
}