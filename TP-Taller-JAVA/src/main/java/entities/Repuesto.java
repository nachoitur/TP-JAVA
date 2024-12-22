package entities;

public class Repuesto {
	private int id_repuesto;
	private String descripcion;
	private float precio;
	private int stock;
	
	public Repuesto(int id_repuesto, String descripcion, float precio, int stock) {
		super();
		this.id_repuesto = id_repuesto;
		this.descripcion = descripcion;
		this.precio = precio;
		this.stock = stock;
	}
	
	public Repuesto() {}

	public int getId_repuesto() {
		return id_repuesto;
	}
	public void setId_repuesto(int id_repuesto) {
		this.id_repuesto = id_repuesto;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public float getPrecio() {
		return precio;
	}
	public void setPrecio(float precio) {
		this.precio = precio;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}

	public String toString() {
		return "Repuesto [id_repuesto=" + id_repuesto + ", descripcion=" + descripcion + ", precio=" + precio
				+ ", stock=" + stock + "]";
	}

}
