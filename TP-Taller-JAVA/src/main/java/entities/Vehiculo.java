package entities;

public class Vehiculo {
	private int id_vehiculo;
	private String patente;
	private String marca;
	private String modelo;
	private int año;
	private String color;
	private String infoAdicional;
	
	
	public Vehiculo(int id_vehiculo, String patente, String marca, String modelo, int año, String color,
			String infoAdicional) {
		super();
		this.id_vehiculo = id_vehiculo;
		this.patente = patente;
		this.marca = marca;
		this.modelo = modelo;
		this.año = año;
		this.color = color;
		this.infoAdicional = infoAdicional;
	}
	
	public Vehiculo() {	}

	public int getId_vehiculo() {
		return id_vehiculo;
	}
	public void setId_vehiculo(int id_vehiculo) {
		this.id_vehiculo = id_vehiculo;
	}
	public String getPatente() {
		return patente;
	}
	public void setPatente(String patente) {
		this.patente = patente;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	public int getAño() {
		return año;
	}
	public void setAño(int año) {
		this.año = año;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getInfoAdicional() {
		return infoAdicional;
	}
	public void setInfoAdicional(String infoAdicional) {
		this.infoAdicional = infoAdicional;
	}

	public String toString() {
		return "Vehiculo [id_vehiculo=" + id_vehiculo + ", patente=" + patente + ", marca=" + marca + ", modelo="
				+ modelo + ", año=" + año + ", color=" + color + ", infoAdicional=" + infoAdicional + "]";
	}
	
}
