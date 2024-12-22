package logic;

import java.util.LinkedList;

import entities.Usuario;
import data.DataUsuario;

public class UsuarioLogic {
	
	private DataUsuario dataU = new DataUsuario();
	
	public LinkedList<Usuario> getAll(){
		return dataU.getAll();
	}
	
	public Usuario getById(int id) {
		return dataU.getById(id);
	}
	
	public void altaUser(Usuario u) {
		dataU.add(u);
	}
	
	public void modificarUser(Usuario u) {
		dataU.update(u);
	}
	
	public void bajaUser(Usuario u) {
		dataU.retirarVehiculo(u);
		dataU.remove(u);
	}
	
	public Usuario validarLoginUsuario(Usuario u)  {
		Usuario userReturn=dataU.getByUserAndPasswd(u.getNombre_usuario(), u.getContraseña());
		return userReturn;
	}
	
	public boolean validarContraseña(String contraseña, String contraseñaRepetida)  {
		return contraseña.equals(contraseñaRepetida)?true:false;
	}
}
