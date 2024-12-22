package entities;

import java.util.LinkedList;

public class Usuario {
	private int id_usuario;
	private String nombre_usuario;
	private String contraseña;
	private String nombre;
	private String apellido;
	private String telefono;
	private String email;
	private String tipo_doc;
	private String num_doc;
	private String direccion;
	private int rol;
	private LinkedList<Vehiculo> vehiculos = new LinkedList<Vehiculo>();
	
	
	public Usuario(int id_usuario, String nombre_usuario, String contraseña, String nombre, String apellido, String telefono,
			String email, String tipo_doc, String num_doc, String direccion, int rol) {
		super();
		this.id_usuario = id_usuario;
		this.nombre_usuario = nombre_usuario;
		this.contraseña = contraseña;
		this.nombre = nombre;
		this.apellido = apellido;
		this.telefono = telefono;
		this.email = email;
		this.tipo_doc = tipo_doc;
		this.num_doc = num_doc;
		this.direccion = direccion;
		this.rol = rol;
	}
	
	public Usuario() {}

	public int getId_usuario() {
		return id_usuario;
	}
	public void setId_usuario(int id_usuario) {
		this.id_usuario = id_usuario;
	}
	public String getNombre_usuario() {
		return nombre_usuario;
	}
	public void setNombre_usuario(String nombre_usuario) {
		this.nombre_usuario = nombre_usuario;
	}
	public String getContraseña() {
		return contraseña;
	}
	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTipo_doc() {
		return tipo_doc;
	}
	public void setTipo_doc(String tipo_doc) {
		this.tipo_doc = tipo_doc;
	}
	public String getNum_doc() {
		return num_doc;
	}
	public void setNum_doc(String num_doc) {
		this.num_doc = num_doc;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public int getRol() {
		return rol;
	}
	public void setRol(int rol) {
		this.rol = rol;
	}
	public LinkedList<Vehiculo> getVehiculos(){
		return vehiculos;
	}
	public void setVehiculos(Vehiculo vehiculo) {
		this.vehiculos.add(vehiculo);
	}
	
	public String toString() {
		return "Usuario [id_usuario=" + id_usuario + ", nombre_usuario=" + nombre_usuario + ", contraseña=" + contraseña + ", nombre="
				+ nombre + ", apellido=" + apellido + ", telefono=" + telefono + ", email=" + email + ", tipo_doc="
				+ tipo_doc + ", num_doc=" + num_doc + ", direccion=" + direccion + ", rol=" + rol + 
				", vehiculos" + vehiculos +"]";
	}

}