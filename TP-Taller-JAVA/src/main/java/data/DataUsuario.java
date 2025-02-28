package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import entities.Usuario;

public class DataUsuario {
	
	
	public LinkedList<Usuario> getAll(){
		Statement stmt=null;
		ResultSet rs=null;
		LinkedList<Usuario> usuarios= new LinkedList<>();
		DataVehiculo dv = new DataVehiculo();
		try {
			stmt= dbConnector.getInstancia().getConn().createStatement();
			rs= stmt.executeQuery("select * from usuario");
			
			if(rs!=null) {
				while(rs.next()) {
					Usuario u=new Usuario();
					u.setId_usuario(rs.getInt("id_usuario"));
					u.setNombre_usuario(rs.getString("nombre_usuario"));
					u.setContraseña(rs.getString("contraseña"));
					u.setNombre(rs.getString("nombre"));
					u.setApellido(rs.getString("apellido"));
					u.setTelefono(rs.getString("telefono"));
					u.setEmail(rs.getString("email"));
					u.setTipo_doc(rs.getString("tipo_doc"));
					u.setNum_doc(rs.getString("num_doc"));
					u.setDireccion(rs.getString("direccion"));
					u.setRol(rs.getInt("rol"));
					dv.setVehiculos(u);
					usuarios.add(u);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				dbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return usuarios;
	}
	
	public Usuario getById(int id) {
		Usuario u=null;
		DataVehiculo dv = new DataVehiculo();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement(
					"select * from usuario where id_usuario=?"
					);
			stmt.setInt(1, id);
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				u=new Usuario();
				
				u.setId_usuario(rs.getInt("id_usuario"));
				u.setNombre_usuario(rs.getString("nombre_usuario"));
				u.setContraseña(rs.getString("contraseña"));
				u.setNombre(rs.getString("nombre"));
				u.setApellido(rs.getString("apellido"));
				u.setTelefono(rs.getString("telefono"));
				u.setEmail(rs.getString("email"));
				u.setTipo_doc(rs.getString("tipo_doc"));
				u.setNum_doc(rs.getString("num_doc"));
				u.setDireccion(rs.getString("direccion"));
				u.setRol(rs.getInt("rol"));
				dv.setVehiculos(u);
				
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
		return u;
	}
	
	public Usuario getByUserAndPasswd(String user, String pass) {
		Usuario u=null;
		DataVehiculo dv = new DataVehiculo();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement(
					"select * from usuario where nombre_usuario=? and contraseña=?"
					);
			stmt.setString(1, user);
			stmt.setString(2, pass);
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				u=new Usuario();
				
				u.setId_usuario(rs.getInt("id_usuario"));
				u.setNombre_usuario(rs.getString("nombre_usuario"));
				u.setContraseña(rs.getString("contraseña"));
				u.setNombre(rs.getString("nombre"));
				u.setApellido(rs.getString("apellido"));
				u.setTelefono(rs.getString("telefono"));
				u.setEmail(rs.getString("email"));
				u.setTipo_doc(rs.getString("tipo_doc"));
				u.setNum_doc(rs.getString("num_doc"));
				u.setDireccion(rs.getString("direccion"));
				u.setRol(rs.getInt("rol"));
				dv.setVehiculos(u);
				
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
		return u;
	}
	
	public Usuario getByDni(String dni) {
		Usuario u=null;
		DataVehiculo dv = new DataVehiculo();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=dbConnector.getInstancia().getConn().prepareStatement(
					"select * from usuario where num_doc=?"
					);
			stmt.setString(1, dni);
			rs=stmt.executeQuery();
			if(rs!=null && rs.next()) {
				u=new Usuario();
				
				u.setId_usuario(rs.getInt("id_usuario"));
				u.setNombre_usuario(rs.getString("nombre_usuario"));
				u.setContraseña(rs.getString("contraseña"));
				u.setNombre(rs.getString("nombre"));
				u.setApellido(rs.getString("apellido"));
				u.setTelefono(rs.getString("telefono"));
				u.setEmail(rs.getString("email"));
				u.setTipo_doc(rs.getString("tipo_doc"));
				u.setNum_doc(rs.getString("num_doc"));
				u.setDireccion(rs.getString("direccion"));
				u.setRol(rs.getInt("rol"));
				dv.setVehiculos(u);
				
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
		return u;
	}
	
	
	public void add(Usuario u) {
		PreparedStatement stmt= null;
		ResultSet keyResultSet=null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"insert into usuario(nombre_usuario,contraseña,nombre,apellido,"
							+"telefono,email,tipo_doc,num_doc,direccion,rol) "
							+ "values(?,?,?,?,?,?,?,?,?,?)",
							PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, u.getNombre_usuario());
			stmt.setString(2, u.getContraseña());
			stmt.setString(3, u.getNombre());
			stmt.setString(4, u.getApellido());
			stmt.setString(5, u.getTelefono());
			stmt.setString(6, u.getEmail());
			stmt.setString(7, u.getTipo_doc());
			stmt.setString(8, u.getNum_doc());
			stmt.setString(9, u.getDireccion());
			stmt.setInt(10, u.getRol());
			stmt.executeUpdate();
			
			keyResultSet=stmt.getGeneratedKeys();
            if(keyResultSet!=null && keyResultSet.next()){
                u.setId_usuario(keyResultSet.getInt(1));
            }
			
		}  catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if(keyResultSet!=null)keyResultSet.close();
                if(stmt!=null)stmt.close();
                dbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
    }

	
	public void update(Usuario usuario) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"update usuario set nombre_usuario=?, contraseña=?, nombre=?, apellido=?, "
							+ "telefono=?, email=?, tipo_doc=?, num_doc=?, direccion=?, rol=? "
							+ "where id_usuario=?");
			stmt.setString(1, usuario.getNombre_usuario());
			stmt.setString(2, usuario.getContraseña());
			stmt.setString(3, usuario.getNombre());
			stmt.setString(4, usuario.getApellido());
			stmt.setString(5, usuario.getTelefono());
			stmt.setString(6, usuario.getEmail());
			stmt.setString(7, usuario.getTipo_doc());
			stmt.setString(8, usuario.getNum_doc());
			stmt.setString(9, usuario.getDireccion());
			stmt.setInt(10, usuario.getRol());
			stmt.setInt(11, usuario.getId_usuario());
			stmt.executeUpdate();
		} catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if(stmt!=null)stmt.close();
                dbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
	}
	
	public void retirarVehiculo(Usuario u) {
		PreparedStatement stmt= null;
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"update vehiculo set id_usuario=? where id_usuario=?");
			stmt.setInt(1, 2);
			stmt.setInt(2, u.getId_usuario());
			stmt.executeUpdate();
		} catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if(stmt!=null)stmt.close();
                dbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
	}
	
	public void remove(Usuario usuario) {
		PreparedStatement stmt= null;
		
		try {
			stmt=dbConnector.getInstancia().getConn().
					prepareStatement(
							"delete from usuario where id_usuario=?");
			stmt.setInt(1, usuario.getId_usuario());
			stmt.executeUpdate();
		} catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if(stmt!=null)stmt.close();
                dbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
	}
}
